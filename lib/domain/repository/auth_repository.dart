import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_v2/domain/entities/RegisterResponseEntity.dart';
import 'package:ecommerce_app_v2/domain/failures.dart';

import '../entities/LoginResponseEntity.dart';

abstract class AuthRepository {
  Future<Either<Failures, RegisterResponseEntity>> register(String email, String password, String name, String phone, String rePassword);
  Future<Either<Failures, LoginResponseEntity>> login(String email, String password, String name);
}
