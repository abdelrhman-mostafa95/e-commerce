import 'package:ecommerce_app_v2/domain/entities/RegisterResponseEntity.dart';

class RegisterResponseDto extends RegisterResponseEntity {
  RegisterResponseDto(
      {super.message, super.user, super.token, super.statusMsg});

  RegisterResponseDto.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    token = json['token'];
  }
}

class UserDto extends UserEntity {
  UserDto({
    super.name,
    super.email,
    this.role,
  });
  // delete to json because it is not needed
  UserDto.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }

  String? role;
}
