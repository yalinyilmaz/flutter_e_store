import 'dart:developer';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_e_store/app/navigation/router.dart';
import 'package:flutter_e_store/app/store/app_store.dart';
import 'package:flutter_e_store/app/theme/new_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'firebase_options.dart';

final ProviderContainer container = ProviderContainer();

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    log('Initializing Firebase...');
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    log('Firebase initialized successfully');
    runApp(UncontrolledProviderScope(
        container: container,
        child: const MyApp()));
  } catch (e) {
    log('Error initializing Firebase: $e');
    // You might want to show an error dialog or screen here
  }
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context)
            .copyWith(textScaler: const TextScaler.linear(1)),
        child: Consumer(
          builder: (context, ref, _) => LoadingOverlay(
            isLoading: ref.watch(isAppLoadingProvider),
            child: child!,
          ),
        ),
      ),
      routerConfig: router,
      title: 'E-Store',
      theme: ThemeData(
        useMaterial3: false,
        textSelectionTheme: TextSelectionThemeData(
          selectionHandleColor: context.greyColor.shade500,
          selectionColor: context.greyColor.shade500,
          cursorColor: context.greyColor.shade500,
        ),
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('tr', 'TR'),
        Locale('en', 'EN'),
      ],
    );
  }
}
