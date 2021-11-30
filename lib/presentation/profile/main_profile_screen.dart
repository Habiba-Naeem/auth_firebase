import 'package:auth_firebase/domain/auth/user/user.dart';
import 'package:auth_firebase/remote/auth_service.dart';
import 'package:auth_firebase/remote/users_service.dart';
import 'package:auth_firebase/shared/bottom_nav.dart';
import 'package:auth_firebase/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  static const String id = 'profile';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return FutureBuilder(
      future: UserService(uid: AuthService().getUser().uid).getUser(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const Profile();
        }
        return const Loading();
      },
    );
  }
}

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    return Scaffold(
      appBar: AppBar(
        title:  Text(user.username),
      ),
      bottomNavigationBar: const BottomNav(),
      body:  Column(
        children: [
          ProfileHeader(),
          ElevatedButton(
                child: const Text("Sign out"),
                onPressed: () async {
                  AuthService().signOut();
                },
              ),
        ],
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
