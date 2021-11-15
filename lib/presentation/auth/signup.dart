import 'package:auth_firebase/application/auth/signup/signup_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatelessWidget {
  final Function onPressed;
  final FirebaseAuth auth;

  const SignUpScreen({Key? key, required this.onPressed, required this.auth})
      : super(key: key);

  Future signUp(String email, String password, BuildContext context) async {
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
          Navigator.pushReplacementNamed(context, '/profile');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    EmailInput(),
                    const SizedBox(
                      height: 20,
                    ),
                    PasswordInput(),
                    MaterialButton(
                        child: Text("Sign Up"),
                        onPressed: () {
                          signUp(state.emailInput, state.passwordInput, context);
                          context.read<SignUpBloc>().add(SignUpButtonPressedEvent());
                        }),
                    //SignUpButton(),
                    // how to use this signup button without passing state

                    MaterialButton(
                        child: const Text("Sign In"),
                        onPressed: () => onPressed())
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
            if (state.showErrors) {
              return "Something went wrong";
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
            if (state.showErrors) {
              return "Something went wrong";
            }
          });
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
