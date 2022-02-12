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

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Login({Key? key}) : super(key: key);

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

  void goToRegistrationPage(context) {
    // Navigator.pushNamedAndRemoveUntil(
    //     context, RegistrationPage.id, (route) => false);
  }

  void onLoginPressed(BuildContext context) async {
    // if (!emailController.text.contains('@')) {
    //   showSnackBar(context, 'Please provide a valid email address.');
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
    // loginUser(context);
  }

  // void loginUser(context) async {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return const ProgressDialog(status: 'Logging you in');
  //     },
  //   );
  //
  //   try {
  //     UserCredential userCredential =
  //     await FirebaseAuth.instance.signInWithEmailAndPassword(
  //       email: emailController.text,
  //       password: passwordController.text,
  //     );
  //
  //     var userID = userCredential.user!.uid;
  //
  //     DatabaseReference userRef =
  //     FirebaseDatabase.instance.ref().child('users/$userID');
  //
  //     userRef.once().then((DatabaseEvent event) {
  //       if (event.snapshot.value == null) {
  //         throw Exception('No user object for this user');
  //       }
  //
  //       Navigator.pushNamedAndRemoveUntil(
  //         context,
  //         MainPage.id,
  //             (route) => false,
  //       );
  //     });
  //   } on FirebaseAuthException catch (e) {
  //     Navigator.pop(context);
  //
  //     if (e.code == 'user-not-found') {
  //       showSnackBar(context, 'No user found for that email.');
  //     } else if (e.code == 'wrong-password') {
  //       showSnackBar(context, 'Wrong password provided for that user.');
  //     }
  //   } catch (e) {
  //     Navigator.pop(context);
  //
  //     showSnackBar(context, 'An unexpected error occurred. Try again');
  //   }
  // }

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
                  'Sign In as a Rider',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, fontFamily: 'Brand-Bold'),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
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
                        text: 'LOGIN',
                        color: BrandColors.colorGreen,
                        onPressed: () {
                          onLoginPressed(context);
                        },
                      ),
                    ],
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    goToRegistrationPage(context);
                  },
                  child: const Text('Don\'t have an account? Sign up here.)'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
