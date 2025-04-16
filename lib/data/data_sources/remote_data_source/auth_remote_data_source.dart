import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_v2/domain/entities/RegisterResponseEntity.dart';
import '../../../domain/failures.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failures, RegisterResponseEntity>> register(RegisterDto registerDto);
}

class RegisterDto {
  final String email;
  final String password;
  final String name;
  final String phone;
  final String rePassword;

  RegisterDto({
    required this.email,
    required this.password,
    required this.name,
    required this.phone,
    required this.rePassword,
  });
}

abstract class BaseRequestBody {
  Map<String, dynamic> toJson();
}

class RegisterRequestBody extends BaseRequestBody {
  final String email;
  final String password;
  final String rePassword;
  final String name;
  final String phone;

  RegisterRequestBody({
    required this.email,
    required this.password,
    required this.rePassword,
    required this.name,
    required this.phone,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
      "rePassword": rePassword,
      "name": name,
      "phone": phone,
    };
  }
}

