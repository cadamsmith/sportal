// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

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
                    'Login',
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
