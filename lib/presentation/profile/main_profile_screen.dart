import 'package:auth_firebase/shared/bottom_nav.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static const String id = 'profile';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNav(),
      body: ProfileHeader(),
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
                      children: [Text("1000"), Text("List")],
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
