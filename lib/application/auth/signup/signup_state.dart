part of 'signup_bloc.dart';

@immutable
class SignUpState{
  final String emailInput;
  final String passwordInput;

  const SignUpState({
    required this.emailInput,
    required this.passwordInput
  });
  factory SignUpState.initial() {
    return const SignUpState(
      emailInput: '',
      passwordInput: '',
    );

  }
  SignUpState copyWith(
      {String? emailInput,
        String? passwordInput,})
  {
    return SignUpState(
      emailInput: emailInput ?? this.emailInput,
      passwordInput: passwordInput ?? this.passwordInput,
    );}
}