import 'package:auth_firebase/application/auth/signin/signin_bloc.dart';
import 'package:auth_firebase/presentation/auth/signin.dart';
import 'package:auth_firebase/presentation/auth/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'application/auth/signup/signup_bloc.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool showSignUp = false;
  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      //setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: showSignUp
          ? BlocProvider(
              create: (context) => SignUpBloc(),
              child: SignUpScreen(
                auth: auth,
                onPressed: () => setState(() => showSignUp = !showSignUp),
              ),
            )
          : BlocProvider(
              create: (context) => SignInBloc(),
              child: SignInScreen(
                  onPressed: () => setState(() => showSignUp = !showSignUp)),
            ),
    );
  }
}
