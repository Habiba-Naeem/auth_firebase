part of 'signin_bloc.dart';

@immutable
abstract class SignInEvent {}

class EmailInputEvent extends SignInEvent {
  final String input;

  EmailInputEvent({required this.input});
}

class PasswordInputEvent extends SignInEvent {
  final String input;

  PasswordInputEvent({required this.input});
}
class SignInButtonPressedEvent extends SignInEvent {
  SignInButtonPressedEvent();
}