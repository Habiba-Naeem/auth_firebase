import 'dart:async';

import 'package:auth_firebase/domain/core/email/email.dart';
import 'package:auth_firebase/domain/core/email/email.dart';
import 'package:auth_firebase/domain/core/password/password.dart';
import 'package:auth_firebase/remote/auth_service.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpState.initial());

  @override
  Stream<SignUpState> mapEventToState(
    SignUpEvent event,
  ) async* {
    if (event is EmailInputEvent) {
      yield state.copyWith(emailInput: event.input);
    }
    if (event is PasswordInputEvent) {
      yield state.copyWith(passwordInput: event.input);
    }
    if (event is SignUpButtonPressedEvent) {
      yield state.copyWith(showErrors: true, loading: true);

      if (state.email.value.isLeft() || state.password.value.isLeft()) {
        yield state.copyWith(loading: true);
        return;
      }
      ;
      await AuthService().signUp(state.email, state.password);
    }
  }
}
