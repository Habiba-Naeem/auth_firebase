part of 'signin_bloc.dart';

@immutable
class SignInState {
  final Email email;
  final Password password;
  final bool showErrors;

  const SignInState({
    required this.email,
    required this.password,
    required this.showErrors,
  });
  factory SignInState.initial() {
    return SignInState(
      email: Email(value: ''),
      password: Password(value: ''),
      showErrors: false,
    );
  }
  SignInState copyWith({
    String? emailInput,
    String? passwordInput,
    bool? showErrors,
  }) {
    return SignInState(
      email: emailInput != null ? Email(value: emailInput) : email,
      password:
          passwordInput != null ? Password(value: passwordInput) : password,
      showErrors: showErrors ?? this.showErrors,
    );
  }
}
