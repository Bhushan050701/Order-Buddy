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
      backgroundColor: const Color(0xFFCECE5A),
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          }
        ),
        title: const Column(
          children: [
            Text("Welcome", style: TextStyle(fontSize: 34, fontStyle: FontStyle.italic)),
            Text("User", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 34)),
          ],
        ),
        centerTitle: true,
      ),

      drawer: Drawer(
          child: ListView(
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xFFCECE5A),
                ),
                child: Text('Menu'),
              ),
              ListTile(
                title: const Text('Order History'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Settings'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('About'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Logout'),
                onTap: () {
                  FirebaseAuth.instance.signOut().then((value) {
                    Fluttertoast.showToast(msg: "LogOut Successful",
                        backgroundColor: Colors.black.withOpacity(0.5));
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));
                  });
                },
              ),
            ],
          )
      ),

      body: const Center()
    );
  }
}