import 'package:flutter/material.dart';
import 'package:orderbuddy/reusable.dart';
import 'package:orderbuddy/signUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCECE5A),
      body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 100, 20, 0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
            child: Image.asset('assets/app_logo.png', width: 260, height: 260),
            ),
            const SizedBox(height: 60),
            reusableTextField("Enter Email", Icons.person_outline, false, _emailTextController),
            const SizedBox(height: 20),
            reusableTextField("Enter Password", Icons.lock_outline, true, _passwordTextController),
            const SizedBox(height: 20),
            signInSignUpButton(context, true, () {
              FirebaseAuth.instance.signInWithEmailAndPassword(
                email: _emailTextController.text,
                password: _passwordTextController.text).then((value) {
                  Fluttertoast.showToast(msg: "LogIn Successful",
                  backgroundColor: Colors.black.withOpacity(0.5));
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));
                }).onError((error, stackTrace) {
                  print("Error ${error.toString()}");
                });
            }),
            signUpOption(context),
          ],
        )
      ),
      ),
    );
  }
}

Row signUpOption(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text("Don't have account? ", style: TextStyle(color: Colors.black87)),
      GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUp()));
        },
        child: const Text(
          " Sign Up",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      )
    ],
  );
}
