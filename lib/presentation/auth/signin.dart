import 'package:auth_firebase/application/auth/signin/signin_bloc.dart';
import 'package:auth_firebase/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatelessWidget {
  final Function onPressed;
  const SignInScreen({Key? key,required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(builder: (context, state){
      return Scaffold(
          appBar: AppBar(
            title: Text("Sign In"),
          ),
          body: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                EmailInput(),
                PasswordInput(),
                SignInButton(),
                MaterialButton(
                    child: const Text("Register"),
                    onPressed: () => onPressed()),
              ],
            ),
          )
      );
    },);
  }
}

class EmailInput extends StatelessWidget {
  const EmailInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(builder: (context, state){
      return TextFormField(
        decoration: const InputDecoration(
            labelText: "Email"
        ) ,
        onChanged: (v){
          context.read<SignInBloc>().add(EmailInputEvent(input: v));
        },
      );

    });
  }
}

class PasswordInput extends StatelessWidget {
  const PasswordInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(builder: (context, state){
      return TextFormField(
        decoration: const InputDecoration(
            labelText: "Password"
        ) ,
        onChanged: (v){
          context.read<SignInBloc>().add(PasswordInputEvent(input: v));
        },
      );

    });
  }
}

class SignInButton extends StatelessWidget {
  const SignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        child: const Text("Sign in"),
        onPressed: (){});
  }
}

