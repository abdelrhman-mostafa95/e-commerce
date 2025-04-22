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
}
