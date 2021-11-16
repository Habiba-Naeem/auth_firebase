import 'package:auth_firebase/presentation/profile/profile.dart';
import 'package:auth_firebase/presentation/theme/theme.dart';
import 'package:auth_firebase/presentation/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp app = await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool showSignUp = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/',
        routes: {
          '/profile': (context) => ProfileScreen(
                auth: auth,
              ),
          '/home': (context) => MyApp(),
        },
        theme: theme,
        home: Wrapper());
  }
}
