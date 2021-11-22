import 'package:auth_firebase/remote/auth_service.dart';
import 'package:auth_firebase/remote/profile_service.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Set up your profile"),
        ),
        body: ProfileForm());
  }
}

class ProfileForm extends StatefulWidget {
  const ProfileForm({Key? key}) : super(key: key);

  @override
  _ProfileFormState createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  String username = '';
  String bio = '';
  int age = 0;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(hintText: "Username"),
            onChanged: (v) {
              setState(() => username = v);
            },
          ),
          TextFormField(
            decoration: const InputDecoration(hintText: "Bio"),
            onChanged: (v) {
              setState(() => bio = v);
            },
          ),
          TextFormField(
            decoration: const InputDecoration(hintText: "Age"),
            onChanged: (v) {
              setState(() => age = int.parse(v));
            },
          ),
          ElevatedButton(
            child: Text("Add Profile"),
            onPressed: () {
              ProfileService(uid: AuthService().getUser().uid)
                  .addProfile(username: username, age: age, bio: bio);
            },
          )
        ],
      ),
    );
  }
}