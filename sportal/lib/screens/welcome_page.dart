import 'package:flutter/material.dart';

import 'login_page.dart';

class WelcomePage extends StatelessWidget {
  static const String id = 'welcome';

  const WelcomePage({Key? key}) : super(key: key);

  void showSnackBar(BuildContext context, String title) {
    final snackBar = SnackBar(
      content: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 15,
        ),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void goToLoginPage(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, LoginPage.id, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                const SizedBox(
                  height: 200,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: const [
                      Text(
                        'Down',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 40,
                          fontFamily: 'Brand-Bold',
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    goToLoginPage(context);
                  },
                  child: const Text('Create an Account'),
                ),
                TextButton(
                  onPressed: () {
                    goToLoginPage(context);
                  },
                  child: const Text('Sign In.'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
