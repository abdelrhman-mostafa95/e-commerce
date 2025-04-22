
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/use_case/Login_use_case.dart';
import 'login_states.dart';

@injectable
class LoginViewModel extends Cubit<LoginStates> {
  final LoginUseCase loginUseCase;
  // Form controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController(text: 'noureen mohamed');

  LoginViewModel({required this.loginUseCase})
      : super(LoginInitialState());

  Future<void> login() async {
    emit(LoginLoadingState(loadingMessage: 'Loading ....'));
    var either = await loginUseCase.invoke(
        emailController.text,
        passwordController.text, nameController.text);
    either.fold((l) => emit(LoginErrorState(failures: l)),
            (response) {
          emit(LoginSuccessState(loginEntity: response));
        });
  }
}
