import 'package:ecommerce_app_v2/domain/repository/auth_repository.dart';

class RegisterUseCase {
  AuthRepository registerRepository;

  RegisterUseCase({required this.registerRepository});
  invoke(String email,
      String password, String name, String rePassword, String phone){
    return registerRepository.register(
        email,
        password, name, rePassword, phone
    );
  }
}