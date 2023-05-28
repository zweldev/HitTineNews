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
    required ValueChanged errorCallback,
  }) async {
    try {
      log('youk dl');
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailAddress, password: password);

      if (FirebaseAuth.instance.currentUser != null) {
        emit(state.copyWith(user: FirebaseAuth.instance.currentUser));

        callback(state.user);
      }
    } on FirebaseAuthException catch (e) {
      errorCallback(e.code);
    }
  }

  void login({
    required String emailAddress,
    required String password,
    required ValueChanged callback,
    required ValueChanged errorCallback,
  }) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);

      if (FirebaseAuth.instance.currentUser != null) {
        emit(state.copyWith(user: FirebaseAuth.instance.currentUser));

        callback(state.user);
      }
    } on FirebaseAuthException catch (e) {
      errorCallback(e.code);
    }
  }
}
