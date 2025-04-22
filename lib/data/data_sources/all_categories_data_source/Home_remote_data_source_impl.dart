import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_v2/data/api_manager/api_manager.dart';
import 'package:ecommerce_app_v2/data/api_manager/app_constants.dart';
import 'package:ecommerce_app_v2/data/models/CategoryResponseDto.dart';

import 'package:ecommerce_app_v2/domain/entities/AllCategoriesEntity.dart';
import 'package:ecommerce_app_v2/domain/entities/BrandsResponseEntity.dart';

import 'package:ecommerce_app_v2/domain/failures.dart';
import 'package:injectable/injectable.dart';

import '../../models/BrandResponseDto.dart';
import 'Home_remote_data_source.dart';

@Injectable(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  ApiManager apiManager;

  HomeRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, AllCategoriesDto>> getAllCategories() async {
    try {
      var checkConnection = await Connectivity().checkConnectivity();
      print("Connection type: $checkConnection");
      if (checkConnection.contains(ConnectivityResult.wifi) ||
          checkConnection.contains(ConnectivityResult.mobile)) {
        var response = await apiManager.getData(
          AppConstants.endPointAllCategories,
        );
        var categoryResponse = AllCategoriesDto.fromJson(response.data);
        print('response status code ${response.statusCode}');
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(categoryResponse);
        } else {
          return Left(Failures(
            errorMessage: response.data['message'] ?? 'Loading Failed',
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
  Future<Either<Failures, BrandResponseDto>> getAllBrands() async{
    try {
      var checkConnection = await Connectivity().checkConnectivity();
      print("Connection type: $checkConnection");
      if (checkConnection.contains(ConnectivityResult.wifi) ||
          checkConnection.contains(ConnectivityResult.mobile)) {
        var response = await apiManager.getData(
          AppConstants.endPointAllBrands,
        );
        var brandsResponse = BrandResponseDto.fromJson(response.data);
        print('response status code ${response.statusCode}');
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(brandsResponse);
        } else {
          return Left(Failures(
            errorMessage: response.data['message'] ?? 'Loading Failed',
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
