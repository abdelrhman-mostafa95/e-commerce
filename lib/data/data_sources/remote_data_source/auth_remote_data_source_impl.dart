import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_v2/data/api_manager/api_manager.dart';
import 'package:ecommerce_app_v2/data/api_manager/app_constants.dart';
import 'package:ecommerce_app_v2/data/models/RegisterResponseDto.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ecommerce_app_v2/domain/failures.dart';

import 'auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiManager apiManager;

  AuthRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, RegisterResponseDto>> register(String email,
      String password, String name, String rePassword, String phone) async {
    var checkConnection = Connectivity().checkConnectivity();
    if(checkConnection == ConnectivityResult.wifi || checkConnection == ConnectivityResult.mobile) {
      var response =
      await apiManager.postData(AppConstants.endPointRegister, body: {
        "email": email,
        "password": password,
        "name": name,
        "rePassword": rePassword,
        "phone": phone
      });
      var registerResponse = RegisterResponseDto.fromJson(response.data);
      if(response.statusCode! >=200 && response.statusCode! < 300) {
        return Right(registerResponse);
      }
      else{
        return Left(ServerError(errorMessage: registerResponse.message!));
      }
    }else{
      return Left(NetworkError(errorMessage: 'No internet connection'));
    }
  }
}
