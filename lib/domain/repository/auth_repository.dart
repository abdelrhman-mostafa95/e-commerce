import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_v2/data/data_sources/remote_data_source/auth_remote_data_source.dart';
import 'package:ecommerce_app_v2/domain/entities/RegisterResponseEntity.dart';
import 'package:ecommerce_app_v2/domain/failures.dart';

abstract class AuthRepository {
  Future<Either<Failures, RegisterResponseEntity>> register(RegisterDto registerDto);
}
