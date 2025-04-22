import 'package:ecommerce_app_v2/domain/entities/LoginResponseEntity.dart';

class LoginResponseDto extends LoginResponseEntity {
  LoginResponseDto({super.message, super.user, super.token});

  LoginResponseDto.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? UserLoginDto.fromJson(json['user']) : null;
    token = json['token'];
  }
}

class UserLoginDto extends UserLoginEntity {
  UserLoginDto({
    super.name,
    super.email,
  });

  UserLoginDto.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
  }
}
