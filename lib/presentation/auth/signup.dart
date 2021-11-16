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
              child: Form(
                autovalidateMode: state.showErrors
                    ? AutovalidateMode.always
                    : AutovalidateMode.disabled,
                child: Column(
                  children: [
                    EmailInput(),
                    const SizedBox(
                      height: 20,
                    ),
                    PasswordInput(),
                    Column(
                      children: [
                        SignUpButton(),
                        TextButton(
                            child: const Text("Sign In"),
                            onPressed: () => onPressed()),
                      ],
                    )
                  ],
                ),
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
          decoration: const InputDecoration(hintText: "Email"),
          onChanged: (v) {
            context.read<SignUpBloc>().add(EmailInputEvent(input: v));
          },
          validator: (v) {
            if (state.showErrors && state.email.value.isLeft()) {
              return "Incorrect email";
            }
          });
    });
  }
}

class PasswordInput extends StatelessWidget {
  const PasswordInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
      return TextFormField(
          decoration: const InputDecoration(hintText: "Password"),
          obscureText: true,
          onChanged: (v) {
            context.read<SignUpBloc>().add(PasswordInputEvent(input: v));
          },
          validator: (v) {
            if (state.showErrors && state.password.value.isLeft()) {
              return "Password should be of 6 characters at least";
            }
          });
    });
  }
}

class SignUpButton extends StatelessWidget {
  const SignUpButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
      return ElevatedButton(
        child: Text("Sign Up"),
        onPressed: () async {
          context.read<SignUpBloc>().add(SignUpButtonPressedEvent());
        },
      );
    });
  }
}
