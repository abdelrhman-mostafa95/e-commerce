import 'package:dio/dio.dart';
import 'package:ecommerce_app_v2/data/api_manager/app_constants.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiManager{
  late Dio dio;
  ApiManager(){
    dio = Dio();
  }
  Future<Response> getData(String endPoint, {Map<String, dynamic>? query}) async {
    return await dio.get(AppConstants.baseUrl+endPoint, queryParameters: query);
  }
  Future<Response> postData(String endPoint, {Map<String, dynamic>? body}) async {
    return await dio.post(AppConstants.baseUrl+endPoint, data: body);
  }
}