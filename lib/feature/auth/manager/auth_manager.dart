import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_e_store/app/api/api.dart';
import 'package:flutter_e_store/app/dialogs/new_message_dialog.dart';
import 'package:flutter_e_store/app/navigation/router.dart';
import 'package:flutter_e_store/app/store/app_store.dart';
import 'package:flutter_e_store/feature/home/view/home_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final authManagerProvider = Provider<AuthManager>((ref) {
  return AuthManager(ref);
});

class AuthManager {
  AuthManager(this.ref);
  final Ref ref;

  Future<void> userRegister(
      {required String email, required String password}) async {
    try {
      log('Starting user registration process');
      AppStore.setAppBussy();
      User? user =
          await api.firbaseAuth.register(email: email, password: password);
      if (user != null) {
        log('User registered successfully: ${user.uid}');
      } else {
        log('User registration failed: user is null');
      }
      AppStore.setAppIdle();
      globalCtx.go(HomePage.routeName);
    } catch (e) {
      log('Error in userRegister: $e');
      MessageDialog.singleButton(
          purpose: MessageDialogPurpose.warning,
          caption: "Hata Oluştu!",
          content: e.toString());
      AppStore.setAppIdle();
    }
  }

  Future<void> userLogin(
      {required String email, required String password}) async {
    try {
      log('Starting user registration process');
      AppStore.setAppBussy();
      User? user =
          await api.firbaseAuth.login(email: email, password: password);
      if (user != null) {
        log('User logged in successfully: ${user.uid}');
      } else {
        log('User login failed: user is null');
      }
      AppStore.setAppIdle();
      globalCtx.go(HomePage.routeName);
    } catch (e) {
      MessageDialog.singleButton(
          purpose: MessageDialogPurpose.warning,
          caption: "Hata Oluştu!",
          content: e.toString());
      log('Error in userlogin: $e');
      AppStore.setAppIdle();
    }
  }

  Future<void> userLoginWithGoogle() async {
    try {
      log('Starting user login with google process');
      AppStore.setAppBussy();
      User? user = await api.firbaseAuth.signInWithGoogle();
      if (user != null) {
        log('User logged in successfully: ${user.uid}');
      } else {
        log('User login failed: user is null');
      }
      AppStore.setAppIdle();
      globalCtx.go(HomePage.routeName);
    } catch (e) {
      MessageDialog.singleButton(
          purpose: MessageDialogPurpose.warning,
          caption: "Hata Oluştu!",
          content: e.toString());
      log('Error in userGoogle Sign in: $e');
      AppStore.setAppIdle();
    }
  }

  Future<void> logout() async {
    try {
      AppStore.setAppBussy();
      await api.firbaseAuth.logout();
      AppStore.setAppIdle();
      globalCtx.go(HomePage.routeName);
    } on Exception catch (e) {
      MessageDialog.singleButton(
          purpose: MessageDialogPurpose.warning,
          caption: "Hata Oluştu!",
          content: e.toString());
      log(e.toString());
    }
  }

  Future<void> deleteAccount() async {
    try {
      AppStore.setAppBussy();
      await api.firbaseAuth.deleteAccount();
      AppStore.setAppIdle();
      globalCtx.go(HomePage.routeName);
    } on Exception catch (e) {
      MessageDialog.singleButton(
          purpose: MessageDialogPurpose.warning,
          caption: "Hata Oluştu!",
          content: e.toString());
      log(e.toString());
    }
  }
}
