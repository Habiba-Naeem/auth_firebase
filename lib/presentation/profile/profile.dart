import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final FirebaseAuth auth;
  const ProfileScreen({Key? key, required this.auth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Habiba Naeem"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            ProfileHeader(),
            ProfileInfo(),
            ProfilePosts(),
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
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CircleAvatar(
            child: Icon(Icons.person),
            minRadius: 50,
          ),
        ),
        Expanded(
          
          child: Column(
        
            children: [
              Row(
                children: [
                  Column(
                    children: [Text("1000"), Text("Posts")],
                  ),
                  Column(
                    children: [Text("1000"), Text("Posts")],
                  ),
                  Column(
                    children: [Text("1000"), Text("Posts")],
                  ),
                ],
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Messages"),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("Habiba Naeem");
  }
}

class ProfilePosts extends StatelessWidget {
  const ProfilePosts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
