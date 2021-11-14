import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final FirebaseAuth auth;
  const ProfileScreen({Key? key, required this.auth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Signed In"),
      ),
      body: Column(
        children: [
          Text("Profile"),
          MaterialButton(
              child: Text("Sign out"),
              onPressed: () async {
                try {
                  await auth.signOut();
                  Navigator.pushReplacementNamed(context, '/home');
                } catch (e) {
                  print("no user");
                }
              })
        ],
      ),
    );
  }
}
