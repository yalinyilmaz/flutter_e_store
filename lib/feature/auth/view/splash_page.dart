import 'package:flutter/material.dart';
import 'package:flutter_e_store/app/theme/new_theme.dart';
import 'package:flutter_e_store/gen/assets.gen.dart';
import 'package:go_router/go_router.dart';
import 'package:supercharged/supercharged.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
  static const routeName = "/";

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(2.seconds, () {
        // 2 saniye sonra auth sayfasına gidilecek.
        //context.go(LoginPage.routeName);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Assets.images.mainLogo.image()
        ],),
      )
      
    );
  }
}
