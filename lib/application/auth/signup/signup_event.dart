part of 'signup_bloc.dart';

@immutable
abstract class SignUpEvent {}

class EmailInputEvent extends SignUpEvent {
  final String input;

  EmailInputEvent({required this.input});
}

class PasswordInputEvent extends SignUpEvent {
  final String input;

  PasswordInputEvent({required this.input});
}
class SignUpButtonPressedEvent extends SignUpEvent {
  SignUpButtonPressedEvent();
}