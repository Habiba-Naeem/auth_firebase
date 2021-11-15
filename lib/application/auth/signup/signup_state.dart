part of 'signup_bloc.dart';

@immutable
class SignUpState {
  final String emailInput;
  final String passwordInput;
  final bool showErrors;

  const SignUpState(
      {required this.emailInput,
      required this.passwordInput,
      required this.showErrors});

  factory SignUpState.initial() {
    return const SignUpState(
        emailInput: '', passwordInput: '', showErrors: false);
  }
  SignUpState copyWith(
      {String? emailInput, String? passwordInput, bool? showErrors}) {
    return SignUpState(
        emailInput: emailInput ?? this.emailInput,
        passwordInput: passwordInput ?? this.passwordInput,
        showErrors: showErrors ?? this.showErrors);
  }
}
