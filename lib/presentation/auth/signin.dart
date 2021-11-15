import 'package:auth_firebase/application/auth/signin/signin_bloc.dart';
import 'package:auth_firebase/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatelessWidget {
  final Function onPressed;
  final FirebaseAuth auth;

  const SignInScreen({Key? key, required this.onPressed, required this.auth})
      : super(key: key);

  Future signIn(String email, String password, BuildContext context) async {
    try {
      UserCredential result = await auth.signInWithEmailAndPassword(
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
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: Text("Sign In"),
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
                    //SignInButton(),
                    MaterialButton(
                        child: Text("Sign in"),
                        onPressed: () {
                          signIn(state.emailInput, state.passwordInput, context);
                          context
                              .read<SignInBloc>()
                              .add(SignInButtonPressedEvent());
                          //Navigator.pushReplacementNamed(context, '/profile');
                        }),

                    MaterialButton(
                        child: const Text("Register"),
                        onPressed: () => onPressed()),
                    MaterialButton(
                        child: Text("Sign in with Google"), onPressed: () {})
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
    return BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
      return TextFormField(
          decoration: const InputDecoration(hintText: "Email"),
          onChanged: (v) {
            context.read<SignInBloc>().add(EmailInputEvent(input: v));
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
    return BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
      return TextFormField(
          decoration: const InputDecoration(hintText: "Password"),
          obscureText: true,
          onChanged: (v) {
            context.read<SignInBloc>().add(PasswordInputEvent(input: v));
          },
          validator: (v) {
            if (state.showErrors) {
              return "Something went wrong";
            }
          });
    });
  }
}

class SignInButton extends StatelessWidget {
  const SignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(child: const Text("Sign in"), onPressed: () {});
  }
}
