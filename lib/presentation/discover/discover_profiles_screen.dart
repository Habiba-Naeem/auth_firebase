import 'package:auth_firebase/domain/auth/user/user.dart';
import 'package:auth_firebase/presentation/router.dart';
import 'package:auth_firebase/remote/auth_service.dart';
import 'package:auth_firebase/remote/users_service.dart';
import 'package:auth_firebase/shared/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DiscoverProfilesScreen extends StatelessWidget {
  static const String id = 'discover profiles';
  const DiscoverProfilesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<UserModel>>.value(
      initialData: [],
      value: UserService(uid: AuthService().getUser().uid).usersList,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Discover"),
        ),
        bottomNavigationBar: const BottomNav(),
        body: const SingleChildScrollView(
          child: DiscoverProfilesList(),
        ),
      ),
    );
  }
}

class DiscoverProfilesList extends StatelessWidget {
  const DiscoverProfilesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final users = Provider.of<List<UserModel>>(context);
    print("User in discover ${users.length}");
    print(UserService(uid: AuthService().getUser().uid).usersList);
    return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              child: ListTile(
                leading: CircleAvatar(),
                title: Text("users[index].username"),
                trailing: Text("no of songs"),
              ),
              onTap: () {
                Navigator.of(context).popAndPushNamed(friend);
              },
            );
          }),
    );
  }
}
