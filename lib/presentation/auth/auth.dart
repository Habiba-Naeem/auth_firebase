import 'package:auth_firebase/application/auth/signin/signin_bloc.dart';
import 'package:auth_firebase/application/auth/signup/signup_bloc.dart';
import 'package:auth_firebase/presentation/auth/signin.dart';
import 'package:auth_firebase/presentation/auth/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignUp = false;

  @override
  Widget build(BuildContext context) {
    return showSignUp
        ? BlocProvider(
            create: (context) => SignUpBloc(),
            child: SignUpScreen(
              onPressed: () => setState(() => showSignUp = !showSignUp),
            ),
          )
        : BlocProvider(
            create: (context) => SignInBloc(),
            child: SignInScreen(
                onPressed: () => setState(() => showSignUp = !showSignUp)),
          );
  }
}
