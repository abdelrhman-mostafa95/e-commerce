class LoginResponseEntity {
  LoginResponseEntity({
    this.message,
    this.user,
    this.token,
    this.statusMsg,
  });

  String? message;
  UserLoginEntity? user;
  String? token;
  String? statusMsg;
}

class UserLoginEntity {
  UserLoginEntity({
    this.name,
    this.email,
  });

  String? name;
  String? email;

  factory UserLoginEntity.fromJson(Map<String, dynamic> json) {
    return UserLoginEntity(
      name: json['name'],
      email: json['email'],
    );
  }
}
