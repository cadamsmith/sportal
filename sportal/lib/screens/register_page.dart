import 'package:flutter/material.dart';

import 'login_page.dart';

class RegisterPage extends StatelessWidget {
  static const String id = 'registration';

  RegisterPage({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void goToLogin(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, LoginPage.id, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(242, 242, 242, 1),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 100,
                    ),
                    child: Image.asset('images/logo_white_bg.png'),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  const Text(
                    'Login to your account',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Brand-Bold',
                    ),
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
                              fillColor: Color.fromRGBO(255, 255, 255, 1),
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
                              fillColor: Color.fromRGBO(255, 255, 255, 1),
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
                          TextFormField(
                            obscureText: true,
                            decoration: const InputDecoration(
                              labelText: 'Confirm Password',
                              border: OutlineInputBorder(),
                              fillColor: Color.fromRGBO(255, 255, 255, 1),
                            ),
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password again.';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                goToLogin(context);
                              }
                            },
                            child: const Text('Sign up'),
                            style: ButtonStyle(
                              textStyle: MaterialStateProperty.all(
                                const TextStyle(fontSize: 22),
                              ),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.green),
                              foregroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              elevation: MaterialStateProperty.all(8),
                              padding: MaterialStateProperty.all(
                                const EdgeInsets.all(12),
                              ),
                              minimumSize: MaterialStateProperty.all(
                                const Size(400, 32),
                              ),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
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
                        goToLogin(context);
                      },
                      child: const Text(
                        'Already have an account? Sign in',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
