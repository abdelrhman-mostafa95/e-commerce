import 'package:ecommerce_app_v2/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase {
  AuthRepository loginRepository;

 LoginUseCase({required this.loginRepository});
  invoke(String email, String password, String name) async {
    return loginRepository.login(
        email, password, name
    );
  }
}