import 'package:flutter/material.dart';
import 'package:sunray_news/app/modules/auth/widgets/text_input_component.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  static String route = '/authscreen';

  final bool isRegister = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    height: 260,
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
                        height: 230,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage('assets/images/big_news.png'))),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Column(
                  children: [
                    TextInputComponent(
                      isPassword: false,
                    ),
                    TextInputComponent(
                      isPassword: true,
                    ),
                    if (isRegister)
                      TextInputComponent(
                        isPassword: true,
                      ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                              style: ButtonStyle(
                                  elevation: MaterialStatePropertyAll(3),
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.amber)),
                              onPressed: () {},
                              icon: Icon(
                                Icons.lock,
                                color: Colors.black,
                              ),
                              label: Text(
                                'Register',
                                style: TextStyle(color: Colors.black),
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'ALready a User?',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
