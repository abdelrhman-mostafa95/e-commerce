import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_v2/data/data_sources/remote_data_source/auth_remote_data_source.dart';
import 'package:ecommerce_app_v2/domain/entities/RegisterResponseEntity.dart';
import 'package:ecommerce_app_v2/domain/failures.dart';
import 'package:ecommerce_app_v2/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository{
  AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImpl({required this.authRemoteDataSource});
  @override
  Future<Either<Failures, RegisterResponseEntity>> register(RegisterDto registerDto) async{
    return await authRemoteDataSource.register(registerDto);
  }

}