import 'package:auth_firebase/application/auth/signin/signin_bloc.dart';
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
                    //SignInButton(),
                    ElevatedButton(
                        child: Text("Sign in"),
                        onPressed: () {
                          signIn(
                              state.emailInput, state.passwordInput, context);
                          context
                              .read<SignInBloc>()
                              .add(SignInButtonPressedEvent());
                          //Navigator.pushReplacementNamed(context, '/profile');
                        }),

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
    return MaterialButton(child: const Text("Sign in"), onPressed: () {});
  }
}
