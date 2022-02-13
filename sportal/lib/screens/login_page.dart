import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../components/progress_dialog.dart';
import 'map_page.dart';
import 'register_page.dart';

class LoginPage extends StatelessWidget {
  static const id = 'login';

  LoginPage({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void showSnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(
      content: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 15,
        ),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void goToRegister(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
        context, RegisterPage.id, (route) => false);
  }

  void onLoginPressed(BuildContext context) async {
    if (!emailController.text.contains('@')) {
      showSnackBar(context, 'Please provide a valid email address.');
      return;
    } else if (passwordController.text.length < 8) {
      showSnackBar(context, 'Please provide a valid password.');
      return;
    }

    loginUser(context);
  }

  void loginUser(context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const ProgressDialog(status: 'Logging you in');
      },
    );

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      var userID = userCredential.user!.uid;

      DocumentReference userRef =
          FirebaseFirestore.instance.collection('users').doc(userID);

      userRef.get().then((DocumentSnapshot snapshot) {
        if (!snapshot.exists) {
          throw Exception('Something went wrong!');
        }

        Navigator.pushNamedAndRemoveUntil(
          context,
          MapPage.id,
          (route) => false,
        );
      });
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);

      if (e.code == 'user-not-found') {
        showSnackBar(context, 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        showSnackBar(context, 'Wrong password provided for that user.');
      }
    } catch (e) {
      Navigator.pop(context);

      showSnackBar(context, 'An unexpected error occurred. Try again');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(242, 242, 242, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 30,
                  ),
                  child: Image.asset('images/logo_white_bg.png'),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  'Login to your account',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Brand-Bold',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                  ),
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
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            onLoginPressed(context);
                          },
                          child: const Text('Sign in'),
                          style: ButtonStyle(
                            textStyle: MaterialStateProperty.all(
                              const TextStyle(
                                fontSize: 22,
                              ),
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32.0,
                  ),
                  child: TextButton(
                    onPressed: () {
                      goToRegister(context);
                    },
                    child: const Text(
                      'Don\'t have an account? Sign up',
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
      ),
    );
  }
}
