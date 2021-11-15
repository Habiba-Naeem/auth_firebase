part of 'signin_bloc.dart';

@immutable
class SignInState {
  final String emailInput;
  final String passwordInput;
  final bool showErrors;

  const SignInState({
    required this.emailInput,
    required this.passwordInput,
    required this.showErrors,
  });
  factory SignInState.initial() {
    return const SignInState(
        emailInput: '', passwordInput: '', showErrors: false);
  }
  SignInState copyWith(
      {String? emailInput, String? passwordInput, bool? showErrors}) {
    return SignInState(
      emailInput: emailInput ?? this.emailInput,
      passwordInput: passwordInput ?? this.passwordInput,
      showErrors: showErrors ?? this.showErrors,
    );
  }
}
