import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_v2/data/api_manager/api_manager.dart';
import 'package:ecommerce_app_v2/data/api_manager/app_constants.dart';
import 'package:ecommerce_app_v2/data/models/RegisterResponseDto.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ecommerce_app_v2/domain/failures.dart';
import 'package:injectable/injectable.dart';

import 'auth_remote_data_source.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiManager apiManager;

  AuthRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, RegisterResponseDto>> register(
      RegisterDto registerDto) async {
    try {
      var checkConnection = await Connectivity().checkConnectivity();
      if (checkConnection[0] == ConnectivityResult.wifi ||
          checkConnection[0] == ConnectivityResult.mobile) {
        // Create the request body model
        final requestBody = RegisterRequestBody(
          email: registerDto.email,
          password: registerDto.password,
          rePassword: registerDto.rePassword,
          name: registerDto.name,
          phone: registerDto.phone,
        );

        // Make the API call
        var response = await apiManager.postData(
          AppConstants.endPointRegister,
          body: requestBody.toJson(),
        );

        var registerResponse = RegisterResponseDto.fromJson(response.data);

        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(registerResponse);
        }

        return Left(Failures(errorMessage: registerResponse.message!));
      }

      return Left(Failures(errorMessage: 'No internet connection'));
    } catch (e) {
      print(e.toString());
      return Left(Failures(errorMessage: e.toString()));
    }
  }
}
