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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('images/google.png'),
                  const SizedBox(
                    height: 70,
                  ),
                  Text(
                    'Login to your account',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 28, fontFamily: 'Brand-Bold'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Email',
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email.';
                          }
                          return null;
                        },
                      )
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Password',
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email.';
                          }
                          return null;
                        },
                      )
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Validate will return true if the form is valid, or false if
                        // the form is invalid.
                        // if (_formKey.currentState!.validate()) {
                        //   // Process data.
                        //
                        // }
                        goToRegister(context);

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
                  ),
                ]
          ),
        ),
      ),
    )
    );
  }
}
