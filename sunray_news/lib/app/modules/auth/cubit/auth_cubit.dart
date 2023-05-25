import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState(isRegister: true));

  void toggleAuth({required bool isRegister}) {
    emit(state.copyWith(isRegister: isRegister));
  }

  void signUp({
    required String emailAddress,
    required String password,
    required ValueChanged callback,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailAddress, password: password);

      if (FirebaseAuth.instance.currentUser != null) {
        emit(state.copyWith(user: FirebaseAuth.instance.currentUser));

        callback(state.user);
      }
    } catch (e) {
      log('Sign up trouble ${e}');
    }
  }

  void login({
    required String emailAddress,
    required String password,
    required ValueChanged callback,
  }) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);

      if (FirebaseAuth.instance.currentUser != null) {
        emit(state.copyWith(user: FirebaseAuth.instance.currentUser));

        callback(state.user);
      }

      // FirebaseAuth.instance.userChanges().listen((User? user) {
      //   if (user != null) {
      //     Navigator.of(context).pushNamedAndRemoveUntil(
      //       MainView.route,
      //       (route) => false,
      //     );
      //   }
      // });
    } catch (e) {
      log('Sign in trouble ${e}');
    }
  }


}
