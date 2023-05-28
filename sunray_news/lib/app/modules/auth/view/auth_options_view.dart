import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_view/splash_view.dart';
import 'package:sunray_news/app/modules/auth/cubit/auth_cubit.dart';

import '../widgets/signin_buttons.dart';
import 'auth_screen.dart';

class AuthOptionView extends StatelessWidget {
  AuthOptionView({super.key});

  static String route = '/auth_option_view';
  @override
  Widget build(BuildContext context) {
    return SplashView(
      showStatusBar: true,
      logo: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Image.asset("assets/images/sunray-news-logo.png"),
      ),
      backgroundColor: Color.fromRGBO(27, 69, 113, 1),
      done: Done(
        curve: Curves.easeOut,
        animationDuration: Duration(milliseconds: 200),
        BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            bool isRegister = state.isRegister;
            return Scaffold(
              backgroundColor: Color.fromRGBO(27, 69, 113, 1),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 300,
                      height: 180,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/sunray-news-logo.png'))),
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                isRegister
                                    ? 'Register to continue'
                                    : 'Welcome Back!',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: Colors.white)),
                          ],
                        ),
                        SizedBox(height: 18),
                        SignInButton(
                          text: isRegister
                              ? 'Register with Google'
                              : 'Continue with Google',
                          img: 'assets/images/g_logo.png',
                          onTap: () {},
                        ),
                        SizedBox(height: 20),
                        SignInButton(
                          text: isRegister
                              ? 'Register with Facebook'
                              : 'Continue with Facebook',
                          img: 'assets/images/facebook.svg',
                          onTap: () {},
                        ),
                        SizedBox(height: 20),
                        SignInButton(
                          text: isRegister
                              ? 'Register with Email/Phone'
                              : 'Continue with Email / Phone',
                          img: 'assets/images/phone.svg',
                          onTap: () {
                            Navigator.pushNamedAndRemoveUntil(
                                context, AuthScreen.route, (route) => true);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              bottomNavigationBar: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    isRegister ? 'Already a user? ' : 'Not a user?',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w400),
                  ),
                  GestureDetector(
                    onTap: () {
                      isRegister = !isRegister;
                      context
                          .read<AuthCubit>()
                          .toggleAuth(isRegister: isRegister);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        isRegister ? 'Login!' : 'Register!',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
