import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hosy/core/services/auth_service.dart';
import 'package:hosy/core/services/validation_service.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isButtonEnabled = false;


  Stream<SignInState> mapEventToState(SignInEvent event) async* {
    if (event is OnTextChangedEvent) {
      if (isButtonEnabled != _checkIfSignInButtonEnabled()) {
        isButtonEnabled = _checkIfSignInButtonEnabled();
        yield SignInButtonEnabledChangedState(isEnabled: isButtonEnabled);
      }
    } else if (event is SignInTappedEvent) {
      if (_checkValidatorsOfTextField()) {
        try {
          yield LoadingState();
          await AuthService.signIn(
              emailController.text, passwordController.text);
          yield NextTabBarPageState();
          // ignore: avoid_print
          print('Go to the next page');
        } catch (e) {
          // ignore: avoid_print
          print('E to string : $e');
          yield SignInErrorState(message: e.toString());
        }
      } else {
        yield ShowErrorState();
      }
    } else if (event is ForgotPasswordTappedEvent) {
      yield NextForgotPasswordPageState();
    } else if (event is SignUpTappedEvent) {
      yield NextSignUpState();
    }
  }

  bool _checkIfSignInButtonEnabled() {
    return emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty;
  }

  bool _checkValidatorsOfTextField() {
    return ValidationService.email(emailController.text) &&
        ValidationService.password(passwordController.text);
  }
}