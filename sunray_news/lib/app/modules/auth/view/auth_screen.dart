import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  TextEditingController emailCon = TextEditingController();
  TextEditingController passWordCon = TextEditingController();
  TextEditingController conFirmPassWordCon = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void showError(String response) {
    showModalBottomSheet(
        context: context,
        isDismissible: true,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.zero)),
        builder: (context) => Container(
              color: Colors.black,
              height: 50,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(response.replaceAll('-', ' ').toUpperCase(),
                        style: TextStyle(color: Colors.yellow)),
                  ],
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        bool isRegister = state.isRegister;

        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Color.fromRGBO(27, 69, 113, 1),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: formKey,
                    child: Column(
                      children: [
                        Text(
                          isRegister ? 'REGISTER' : 'LOG IN',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.white),
                        ),
                        TextInputComponent(
                          controller: emailCon,
                          isPassword: false,
                          validator: (e) => EmailValidator.validate(e!)
                              ? null
                              : 'Enter a valid email',
                        ),
                        TextInputComponent(
                          controller: passWordCon,
                          isPassword: true,
                          validator: (e) => e!.isEmpty
                              ? 'required Password'
                              : e.length < 8
                                  ? 'Password length should be longer than 8'
                                  : null,
                        ),
                        isRegister
                            ? TextInputComponent(
                                validator: (e) => e == passWordCon.text
                                    ? null
                                    : 'Password should match',
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
                                      backgroundColor: MaterialStatePropertyAll(
                                          Colors.amber)),
                                  onPressed: () async {
                                    if (!formKey.currentState!.validate()) {
                                      return;
                                    }

                                    final SharedPreferences prefs =
                                        await SharedPreferences.getInstance();

                                    isRegister
                                        ? context.read<AuthCubit>().signUp(
                                            emailAddress: emailCon.text,
                                            password: passWordCon.text,
                                            callback: (value) {
                                              log('user data ${value}');
                                              prefs.setString(
                                                  'userdata', value.toString());

                                              Navigator.of(context)
                                                  .pushNamedAndRemoveUntil(
                                                      MainView.route,
                                                      (route) => false);
                                            },
                                            errorCallback: (e) {
                                              showError(e);
                                            })
                                        : context.read<AuthCubit>().login(
                                            emailAddress: emailCon.text,
                                            password: passWordCon.text,
                                            callback: (value) {
                                              prefs.setString(
                                                  'userdata', value.toString());

                                              Navigator.of(context)
                                                  .pushNamedAndRemoveUntil(
                                                      MainView.route,
                                                      (route) => false);
                                            },
                                            errorCallback: (e) {
                                              showError(e);
                                            });
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
                                  context
                                      .read<AuthCubit>()
                                      .toggleAuth(isRegister: isRegister);
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
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
