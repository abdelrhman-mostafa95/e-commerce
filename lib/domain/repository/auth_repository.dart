import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_v2/domain/entities/RegisterResponseEntity.dart';
import 'package:ecommerce_app_v2/domain/failures.dart';

abstract class AuthRepository {
  Future<Either<Failures, RegisterResponseEntity>> register(String email,
      String password, String name, String rePassword, String phone);
}
