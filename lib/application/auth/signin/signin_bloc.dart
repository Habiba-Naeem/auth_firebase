import 'dart:async';

import 'package:auth_firebase/domain/core/email/email.dart';
import 'package:auth_firebase/domain/core/password/password.dart';
import 'package:auth_firebase/presentation/remote/auth_service.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInState.initial());

  @override
  Stream<SignInState> mapEventToState(
    SignInEvent event,
  ) async* {
    if (event is EmailInputEvent) {
      yield state.copyWith(emailInput: event.input);
    }
    if (event is PasswordInputEvent) {
      yield state.copyWith(passwordInput: event.input);
    }
    if (event is SignInButtonPressedEvent) {
      yield state.copyWith(showErrors: true, loading: true);
      //if any input is invalid then just return as nothing needs to be done in that case
      if (state.email.value.isLeft() || state.password.value.isLeft()) {
        yield state.copyWith(loading: false);
        return;
      }
      
      await AuthService().signIn(state.email, state.password);
    }
  }
}
