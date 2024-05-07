import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'login.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text("Logout"),
          onPressed: () {
            FirebaseAuth.instance.signOut().then((value) {
              Fluttertoast.showToast(msg: "LogOut Successful",
                  backgroundColor: Colors.black.withOpacity(0.5));
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));
            });
          }
        ),
      ),
    );
  }
}
