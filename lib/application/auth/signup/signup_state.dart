part of 'signup_bloc.dart';

@immutable
class SignUpState {
  final Email email;
  final Password password;
  final bool showErrors;

  const SignUpState({
    required this.email,
    required this.password,
    required this.showErrors,
  });

  factory SignUpState.initial() {
    return SignUpState(
      email: Email(input: ''),
      password: Password(input: ''),
      showErrors: false,
    );
  }
  SignUpState copyWith({
    String? emailInput,
    String? passwordInput,
    bool? showErrors,
  }) {
    return SignUpState(
        email: emailInput != null ? Email(input: emailInput) : email,
        password:
            passwordInput != null ? Password(input: passwordInput) : password,
        showErrors: showErrors ?? this.showErrors);
  }
}
