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

  RegisterViewModel({required this.registerUseCase})
      : super(RegisterInitialState());

  Future<void> register() async {
    emit(RegisterLoadingState(loadingMessage: 'Loading ....'));
    var either = await registerUseCase.invoke(
        emailController.text,
        passwordController.text,
        nameController.text,
        phoneController.text,
        rePasswordController.text
    );
    either.fold((l) => emit(RegisterErrorState(failures: l)),
            (response) {
          emit(RegisterSuccessState(registerEntity: response));
        });
  }
}
