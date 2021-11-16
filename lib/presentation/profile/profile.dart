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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              ProfileHeader(),
              const SizedBox(
                height: 20,
              ),
              ProfileInfo(),
              ProfilePosts(),
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                    child: Text("Sign out"),
                    onPressed: () async {
                      try {
                        await auth.signOut();
                        Navigator.pushReplacementNamed(context, '/home');
                      } catch (e) {
                        print("no user");
                      }
                    }),
              )
            ],
          ),
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
                  Expanded(
                    child: Column(
                      children: [Text("1000"), Text("Posts")],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [Text("233"), Text("Followers")],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [Text("134"), Text("Following")],
                    ),
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
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Text("Habiba Naeem"), Text("Bio")],
      ),
    );
  }
}

class ProfilePosts extends StatelessWidget {
  const ProfilePosts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
