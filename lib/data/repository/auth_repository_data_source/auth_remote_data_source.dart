import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_v2/data/data_sources/remote_data_source/auth_remote_data_source.dart';
import 'package:ecommerce_app_v2/domain/entities/RegisterResponseEntity.dart';
import 'package:ecommerce_app_v2/domain/failures.dart';
import 'package:ecommerce_app_v2/domain/repository/auth_repository.dart';

class AuthRemoteDataSourceImpl implements AuthRepository{
  AuthRemoteDataSource authRemoteDataSource;
  AuthRemoteDataSourceImpl({required this.authRemoteDataSource});
  @override
  Future<Either<Failures, RegisterResponseEntity>> register(String email, String password, String name, String rePassword, String phone) {
    return authRemoteDataSource.register(email, password, name, rePassword, phone);
  }

}