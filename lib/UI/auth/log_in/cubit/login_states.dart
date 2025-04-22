import 'package:ecommerce_app_v2/domain/failures.dart';

import '../../../../domain/entities/LoginResponseEntity.dart';

class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {
  String loadingMessage = 'Loading....';

  LoginLoadingState({required this.loadingMessage});
}

class LoginErrorState extends LoginStates {
  Failures failures;
  LoginErrorState({required this.failures});
}

class LoginSuccessState extends LoginStates {
  LoginResponseEntity loginEntity;
  LoginSuccessState({required this.loginEntity});
}