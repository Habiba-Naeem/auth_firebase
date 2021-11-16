import 'package:auth_firebase/application/auth/signin/signin_bloc.dart';
import 'package:auth_firebase/remote/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatelessWidget {
  final Function onPressed;

  const SignInScreen({Key? key, required this.onPressed}) : super(key: key);

/*
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
*/
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
                  children: [
                    EmailInput(),
                    const SizedBox(
                      height: 20,
                    ),
                    PasswordInput(),
                    SignInButton(),
                    TextButton(
                        child: const Text("Register"),
                        onPressed: () => onPressed()),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: OutlinedButton(
                          child: Text("Sign in with Google"),
                          onPressed: () {
                            //signInWithGoogle();
                          }),
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
    return BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
      return ElevatedButton(
        child: Text("Sign In"),
        onPressed: () async {
          await AuthService().signIn(state.emailInput, state.passwordInput);

          context.read<SignInBloc>().add(SignInButtonPressedEvent());
        },
      );
    });
  }
}
