part of 'signup_bloc.dart';

@immutable
class SignUpState {
  final Email email;
  final Password password;
  final bool showErrors;
  final bool loading;

  const SignUpState({
    required this.email,
    required this.password,
    required this.showErrors,
    required this.loading
  });

  factory SignUpState.initial() {
    return SignUpState(
      email: Email(input: ''),
      password: Password(input: ''),
      showErrors: false,
      loading: false
    );
  }
  SignUpState copyWith({
    String? emailInput,
    String? passwordInput,
    bool? showErrors,
    bool? loading
  }) {
    return SignUpState(
        email: emailInput != null ? Email(input: emailInput) : email,
        password:
            passwordInput != null ? Password(input: passwordInput) : password,
        showErrors: showErrors ?? this.showErrors,
        loading: loading ?? this.loading
        );
  }
}
