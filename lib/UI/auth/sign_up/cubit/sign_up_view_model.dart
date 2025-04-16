import 'package:ecommerce_app_v2/UI/auth/sign_up/cubit/sign_in_states.dart';
import 'package:ecommerce_app_v2/domain/use_case/Register_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../data/data_sources/remote_data_source/auth_remote_data_source.dart';

@injectable
class RegisterViewModel extends Cubit<RegisterStates> {
  final RegisterUseCase registerUseCase;

  // Form controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  RegisterViewModel({required this.registerUseCase}) : super(RegisterInitialState());

  void register() async {
    emit(RegisterLoadingState(loadingMessage: 'Loading ...'));

    // Create the DTO from form values
    final dto = RegisterDto(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
      name: nameController.text.trim(),
      phone: phoneController.text.trim(),
      rePassword: rePasswordController.text.trim(),
    );

    // Call the use case
    final either = await registerUseCase.invoke(dto);

    either.fold(
          (error) => emit(RegisterErrorState(failures: error)),
          (response) => emit(RegisterSuccessState(registerEntity: response)),
    );
  }
}
