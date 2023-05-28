import 'package:flutter/material.dart';

import '../widgets/signin_buttons.dart';

class AuthOptionView extends StatelessWidget {
  const AuthOptionView({super.key});

  static String route = '/auth_option_view';

  @override
  Widget build(BuildContext context) {
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
                      image: AssetImage('assets/images/sunray-news-logo.png'))),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Welcome Back!',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.white)),
                  ],
                ),
                SizedBox(height: 18),
                SignInButton(
                  text: 'Continue with Google',
                  img: 'assets/images/g_logo.png',
                  onTap: () {},
                ),
                SizedBox(height: 20),
                SignInButton(
                  text: 'Continue with Facebook',
                  img: 'assets/images/facebook.svg',
                  onTap: () {},
                ),
                SizedBox(height: 20),
                SignInButton(
                  text: 'Continue with Phone Number',
                  img: 'assets/images/phone.svg',
                  onTap: () {},
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
            'Not a user? ',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
          ),
          GestureDetector(
            onTap: () {},
            child: Text(
              'Register!',
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
