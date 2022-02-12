import 'package:flutter/material.dart';
import '../components/progress_dialog.dart';
import 'welcome.dart';
import '../components/taxi-button.dart';
import 'login.dart';
import '../brand_colors.dart';

class Register extends StatelessWidget {
  static const String id = 'registration';

  Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Brand-Bold',
                  ),
                ),
              ],
            )
          ),
        ),
      ),
    );
  }
}
