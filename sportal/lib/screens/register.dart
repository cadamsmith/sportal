// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

// import '../components/progress_dialog.dart';
import '../components/progress_dialog.dart';
import 'welcome.dart';
import '../components/taxi-button.dart';
import 'login.dart';
import '../brand_colors.dart';

class Register extends StatelessWidget {
  static const String id = 'registration';

  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  Register({Key? key}) : super(key: key);

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

  void onRegisterPressed(BuildContext context) async {
    // if (fullNameController.text.length < 3) {
    //   showSnackBar(context, 'Please provide a valid full name.');
    //   return;
    // } else if (!emailController.text.contains('@')) {
    //   showSnackBar(context, 'Please provide a valid email address.');
    //   return;
    // } else if (phoneController.text.length < 10) {
    //   showSnackBar(context, 'Please provide a valid phone number.');
    //   return;
    // } else if (passwordController.text.length < 8) {
    //   showSnackBar(context, 'Please provide a valid password.');
    //   return;
    // }
    //
    // var connectivityResult = await (Connectivity().checkConnectivity());
    // if (connectivityResult == ConnectivityResult.none) {
    //   showSnackBar(context, 'No internet connectivity');
    // }
    //
    // registerUser(context);
  }

  void registerUser(BuildContext context) async {
    // showDialog(
    //   context: context,
    //   builder: (BuildContext context) {
    //     return const ProgressDialog(status: 'Registering you...');
    //   },
    // );
    //
    // try {
    //   UserCredential userCredential =
    //   await FirebaseAuth.instance.createUserWithEmailAndPassword(
    //     email: emailController.text,
    //     password: passwordController.text,
    //   );
    //
    //   var userID = userCredential.user!.uid;
    //
    //   DatabaseReference newUserRef =
    //   FirebaseDatabase.instance.ref().child('users/$userID');
    //
    //   Map userMap = {
    //     'fullName': fullNameController.text,
    //     'email': emailController.text,
    //     'phone': phoneController.text,
    //   };
    //
    //   newUserRef.set(userMap);
    //
    //   Navigator.pushNamedAndRemoveUntil(context, MainPage.id, (route) => false);
    // } on FirebaseAuthException catch (e) {
    //   Navigator.pop(context);
    //
    //   if (e.code == 'weak-password') {
    //     showSnackBar(context, 'The password provided is too weak.');
    //   } else if (e.code == 'email-already-in-use') {
    //     showSnackBar(context, 'An account already exists for that email.');
    //   }
    // } catch (e) {
    //   Navigator.pop(context);
    //
    //   showSnackBar(context, 'An unexpected error occurred. Try again');
    // }
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
                  height: 70,
                ),
                const Image(
                  alignment: Alignment.center,
                  height: 100,
                  width: 100,
                  image: AssetImage('images/logo.png'),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  'Create a Rider\'s Account',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, fontFamily: 'Brand-Bold'),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: fullNameController,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          labelText: 'Full Name',
                          labelStyle: TextStyle(
                            fontSize: 14,
                          ),
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                          ),
                        ),
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                        decoration: const InputDecoration(
                          labelText: 'Email Address',
                          labelStyle: TextStyle(
                            fontSize: 14,
                          ),
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                          ),
                        ),
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          labelText: 'Phone Number',
                          labelStyle: TextStyle(
                            fontSize: 14,
                          ),
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                          ),
                        ),
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            fontSize: 14,
                          ),
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                          ),
                        ),
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      TaxiButton(
                        text: 'REGISTER',
                        color: BrandColors.colorGreen,
                        onPressed: () {
                          onRegisterPressed(context);
                        },
                      ),
                    ],
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    goToLoginPage(context);
                  },
                  child: const Text('Already have an account? Log in here.'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
