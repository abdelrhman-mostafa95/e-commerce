import 'package:ecommerce_app_v2/data/data_sources/remote_data_source/auth_remote_data_source.dart';
import 'package:ecommerce_app_v2/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterUseCase {
  AuthRepository registerRepository;

  RegisterUseCase({required this.registerRepository});
  invoke(String email, String password, String name, String phone, String rePassword) async {
    return registerRepository.register(
        email, password, name, phone, rePassword
    );
  }
}