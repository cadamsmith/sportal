import 'package:flutter/material.dart';
import '../components/progress_dialog.dart';
import 'welcome.dart';
import '../components/taxi-button.dart';
import 'login.dart';
import '../brand_colors.dart';

class Welcome extends StatelessWidget {
  static const String id = 'welcome';

  Welcome({Key? key}) : super(key: key);

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
    Navigator.pushNamedAndRemoveUntil(context, Login.id, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 200,
                ),

                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const Text(
                        'Down',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 40, fontFamily: 'Brand-Bold'),
                      )
                    ]
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
