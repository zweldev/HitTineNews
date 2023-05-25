import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sunray_news/app/modules/auth/cubit/auth_cubit.dart';
import 'package:sunray_news/app/modules/auth/widgets/text_input_component.dart';
import 'package:sunray_news/app/modules/main/views/main_view.dart';

class AuthScreen extends StatefulWidget {
  AuthScreen({super.key});

  static String route = '/authscreen';

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isRegister = true;
  TextEditingController emailCon = TextEditingController();
  TextEditingController passWordCon = TextEditingController();
  TextEditingController conFirmPassWordCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 70, bottom: 80),
                child: Container(
                  height: 180,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.6),
                        spreadRadius: 2,
                        blurRadius: 1,
                        offset: Offset(1, 4),
                      )
                    ],
                    color: Theme.of(context).colorScheme.surface,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/big_news.png'))),
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  TextInputComponent(
                    controller: emailCon,
                    isPassword: false,
                  ),
                  TextInputComponent(
                    controller: passWordCon,
                    isPassword: true,
                  ),
                  isRegister
                      ? TextInputComponent(
                          isPassword: true,
                          controller: conFirmPassWordCon,
                        )
                      : SizedBox(),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                            style: ButtonStyle(
                                elevation: MaterialStatePropertyAll(3),
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.amber)),
                            onPressed: () {
                              isRegister
                                  ? context.read<AuthCubit>().signUp(
                                        emailAddress: emailCon.text,
                                        password: passWordCon.text,
                                        callback: (value) =>
                                            Navigator.of(context)
                                                .pushNamedAndRemoveUntil(
                                                    MainView.route,
                                                    (route) => false),
                                      )
                                  : context.read<AuthCubit>().login(
                                        emailAddress: emailCon.text,
                                        password: passWordCon.text,
                                        callback: (value) =>
                                            Navigator.of(context)
                                                .pushNamedAndRemoveUntil(
                                                    MainView.route,
                                                    (route) => false),
                                      );
                            },
                            icon: Icon(
                              Icons.lock,
                              color: Colors.black,
                            ),
                            label: Text(
                              isRegister ? 'Register' : 'Log in',
                              style: TextStyle(color: Colors.black),
                            )),
                      ),
                    ],
                  ),
                  SizedBox(height: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        isRegister ? 'ALready a User?' : 'New User?',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(width: 10),
                      GestureDetector(
                          onTap: () {
                            isRegister = !isRegister;
                            setState(() {});
                          },
                          child: Text(
                            isRegister ? 'Login' : 'Create Account',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ))
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/**
 * try {
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: emailAddress,
    password: password,
  );
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
  }
} catch (e) {
  print(e);
}
 */