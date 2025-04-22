import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_v2/data/api_manager/api_manager.dart';
import 'package:ecommerce_app_v2/data/api_manager/app_constants.dart';
import 'package:ecommerce_app_v2/data/models/RegisterResponseDto.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ecommerce_app_v2/domain/failures.dart';
import 'package:injectable/injectable.dart';

import '../../models/LoginResponseDto.dart';
import 'auth_remote_data_source.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiManager apiManager;

  AuthRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, RegisterResponseDto>> register(String email,
      String password, String name, String phone, String rePassword) async {
    try {
      var checkConnection = await Connectivity().checkConnectivity();
      print("Connection type: $checkConnection");
      if (checkConnection.contains(ConnectivityResult.wifi) ||
          checkConnection.contains(ConnectivityResult.mobile)) {
        print('inside check connection');
        final requestBody = {
          'email': email,
          'password': password,
          'name': name,
          'phone': phone,
          'rePassword': rePassword
        };
        print('Request body: $requestBody');
        var response = await apiManager.postData(
          AppConstants.endPointRegister,
          body: requestBody,
        );
        print('Response body: ${response.data}');
        var registerResponse = RegisterResponseDto.fromJson(response.data);
        print('response status code ${response.statusCode}');
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(registerResponse);
        } else {
          return Left(Failures(
            errorMessage: response.data['message'] ?? 'Registration failed',
          ));
        }
      } else {
        return Left(Failures(errorMessage: 'No internet connection'));
      }
    } catch (e) {
      print(e.toString());
      return Left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, LoginResponseDto>> login(String email,
      String password, String name) async {
    try {
      var checkConnection = await Connectivity().checkConnectivity();
      print("Connection type: $checkConnection");
      if (checkConnection.contains(ConnectivityResult.wifi) ||
          checkConnection.contains(ConnectivityResult.mobile)) {
        print('inside check connection');
        final loginBody = {
          'name' : name,
          'email': email,
          'password': password,
        };
        print('Request body: $loginBody');
        var response = await apiManager.postData(
          AppConstants.endPointLogin,
          body:loginBody,
        );
        print('Response body: ${response.data}');
        var loginResponse = LoginResponseDto.fromJson(response.data);
        print('response status code ${response.statusCode}');
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(loginResponse);
        } else {
          return Left(Failures(
            errorMessage: response.data['message'] ?? 'Login failed',
          ));
        }
      } else {
        return Left(Failures(errorMessage: 'No internet connection'));
      }
    } catch (e) {
      print(e.toString());
      return Left(Failures(errorMessage: e.toString()));
    }
  }
}
