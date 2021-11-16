import 'package:auth_firebase/presentation/profile/profile.dart';
import 'package:auth_firebase/presentation/theme/theme.dart';
import 'package:auth_firebase/presentation/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/profile': (context) => ProfileScreen(),
      },
      theme: theme,
      home: FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Wrapper();
          }
          return const Center(
            child: Text("Hello"),
          );
        },
      ),
    );
  }
}
