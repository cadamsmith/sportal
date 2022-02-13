// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:sportal/screens/register.dart';

// import '../brand_colors.dart';
// import '../components/progress_dialog.dart';
// import '../components/taxi_button.dart';
import '../brand_colors.dart';
import '../components/taxi-button.dart';
import '../main.dart';
// import 'registration_page.dart';

class Login extends StatelessWidget {
  static const id = 'login';

  Login({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  void goToRegister(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, Register.id, (route) => false);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(242, 242, 242, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('images/logo.png'),
                  const SizedBox(
                    height: 70,
                  ),
                  Text(
                    'Login to your account',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 24, fontFamily: 'Brand-Bold'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(
                                  labelText: 'Email',
                                  border: OutlineInputBorder(),
                                  fillColor: Color.fromRGBO(255, 255, 255, 1)
                              ),
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email.';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            TextFormField(
                              obscureText: true,
                              decoration: const InputDecoration(
                                  labelText: 'Password',
                                  border: OutlineInputBorder(),
                                  fillColor: Color.fromRGBO(255, 255, 255, 1)
                              ),
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password.';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  // Validate will return true if the form is valid, or false if
                                  // the form is invalid.
                                  if (_formKey.currentState!.validate()) {
                                    goToRegister(context);

                                    //needs to login with firebase based on the user's entered email and password.

                                    //Then, they should be redirected to the home map page once logged in.


                                  }
                                },
                                child: const Text('Sign in'),
                                style: ButtonStyle(
                                  textStyle: MaterialStateProperty.all(
                                    const TextStyle(fontSize: 22),
                                  ),
                                  backgroundColor: MaterialStateProperty.all(Colors.green),
                                  foregroundColor: MaterialStateProperty.all(Colors.white),
                                  elevation: MaterialStateProperty.all(8),
                                  padding: MaterialStateProperty.all(const EdgeInsets.all(12)),
                                  minimumSize: MaterialStateProperty.all(const Size(400, 32)),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                )
                            ),
                          ],
                        ),
                      ),

                  ),

                  const SizedBox(
                    height: 32,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: TextButton(
                        onPressed: () {
                          // Validate will return true if the form is valid, or false if
                          // the form is invalid.
                          // if (_formKey.currentState!.validate()) {
                          //   // Process data.
                          //
                          // }
                          goToRegister(context);

                        },
                        child: const Text('Don\'t have an account? Sign up', style: TextStyle(fontSize: 18, color: Colors.black), textAlign: TextAlign.center)

                    ),
                  ),
                ]
          ),
        ),
      ),
    )
    );
  }
}
