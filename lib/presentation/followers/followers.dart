import 'package:auth_firebase/shared/bottom_nav.dart';
import 'package:flutter/material.dart';

class FriendScreen extends StatelessWidget {
  static const String id = 'Friend';
  const FriendScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("data"),
      ),
      bottomNavigationBar: const BottomNav(),
      body:  Column(
        children: [
          FriendHeader(),
        ],
      ),
    );
  }
}

class FriendHeader extends StatelessWidget {
  const FriendHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
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
                      children: const [Text("1000"), Text("List")],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: const [Text("233"), Text("Followers")],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: const [Text("134"), Text("Following")],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Messages"),
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
