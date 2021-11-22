part of 'signin_bloc.dart';

@immutable
class SignInState {
  final Email email;
  final Password password;
  final bool showErrors;
  final bool loading;

  const SignInState({
    required this.email,
    required this.password,
    required this.showErrors,
    required this.loading,
  });
  factory SignInState.initial() {
    return SignInState(
        email: Email(input: ''),
        password: Password(input: ''),
        showErrors: false,
        loading: false);
  }
  SignInState copyWith(
      {
        String? emailInput,
      String? passwordInput,
      bool? showErrors,
      bool? loading
      
      }) {
    return SignInState(
        email: emailInput != null ? Email(input: emailInput) : email,
        password:
            passwordInput != null ? Password(input: passwordInput) : password,
        showErrors: showErrors ?? this.showErrors,
        loading: loading ?? this.loading);
  }
}
