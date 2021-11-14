part of 'signin_bloc.dart';

@immutable
class SignInState{
  final String emailInput;
  final String passwordInput;

  const SignInState({
    required this.emailInput,
    required this.passwordInput
  });
  factory SignInState.initial() {
    return const SignInState(
      emailInput: '',
      passwordInput: '',
    );

  }
  SignInState copyWith(
      {String? emailInput,
        String? passwordInput,})
  {
    return SignInState(
      emailInput: emailInput ?? this.emailInput,
      passwordInput: passwordInput ?? this.passwordInput,
    );}
}