import 'package:auth_firebase/application/auth/signup/signup_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatelessWidget {
  final Function onPressed;
  const SignUpScreen({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: Text("Sign Up"),
            ),
            body: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  EmailInput(),
                  PasswordInput(),
                  SignUpButton(),
                  MaterialButton(
                      child: const Text("Sign In"),
                      onPressed: () => onPressed())
                ],
              ),
            ));
      },
    );
  }
}

class EmailInput extends StatelessWidget {
  const EmailInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
      return TextFormField(
        decoration: const InputDecoration(labelText: "Email"),
        onChanged: (v) {
          context.read<SignUpBloc>().add(EmailInputEvent(input: v));
        },
      );
    });
  }
}

class PasswordInput extends StatelessWidget {
  const PasswordInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
      return TextFormField(
        decoration: const InputDecoration(labelText: "Password"),
        onChanged: (v) {
          context.read<SignUpBloc>().add(PasswordInputEvent(input: v));
        },
      );
    });
  }
}

class SignUpButton extends StatelessWidget {
  const SignUpButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(child: const Text("Sign Up"), onPressed: () {});
  }
}
