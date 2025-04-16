import 'package:ecommerce_app_v2/domain/entities/RegisterResponseEntity.dart';
import 'package:ecommerce_app_v2/domain/failures.dart';

class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {
  String loadingMessage = 'Loading....';

  RegisterLoadingState({required this.loadingMessage});
}

class RegisterErrorState extends RegisterStates {
  Failures failures;
  RegisterErrorState({required this.failures});
}

class RegisterSuccessState extends RegisterStates {
  RegisterResponseEntity registerEntity;
  RegisterSuccessState({required this.registerEntity});
}