import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer';

class UserAuthClient {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<User?> register(
      {required String email, required String password}) async {
    log('Attempting to create user with email: $email');
    UserCredential userCredential =
        await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    log('User created successfully: ${userCredential.user?.uid}');
    return userCredential.user;
  }

    Future<User?> login(
      {required String email, required String password}) async {
    log('Attempting to sign in user with email: $email');
    UserCredential userCredential =
        await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    log('User signed in successfully: ${userCredential.user?.uid}');
    return userCredential.user;
  }

  Future<User?> signInWithGoogle({required String email, required String password}) async {
    log('Attempting to sign in user with email: $email');
    UserCredential userCredential =
        await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    log('User signed in successfully: ${userCredential.user?.uid}');
    return userCredential.user;
  }

}
