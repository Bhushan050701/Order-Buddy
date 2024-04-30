import 'package:flutter/material.dart';
import 'package:orderbuddy/reusable.dart';

import 'home.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _userNameTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCECE5A),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 250, 20, 0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              reusableTextField("Enter Name", Icons.person_outline, false, _userNameTextController),
              const SizedBox(
                height: 20,
              ),
              reusableTextField("Enter Email", Icons.person_outline, false, _emailTextController),
              const SizedBox(
                height: 20,
              ),
              reusableTextField("Enter Password", Icons.lock_outlined, true, _passwordTextController),
              const SizedBox(
                height: 20,
              ),
              signInSignUpButton(context, true, () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));
              })
            ]
          )
        )
      )
    );
  }
}
