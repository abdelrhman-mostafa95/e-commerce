import 'package:ecommerce_app_v2/domain/failures.dart';

import '../../../../domain/entities/AllCategoriesEntity.dart';
import '../../../../domain/entities/BrandsResponseEntity.dart';
import '../../../../domain/entities/LoginResponseEntity.dart';

class CategoryStates {}

class CategoryInitialState extends CategoryStates {}

class CategoryLoadingState extends CategoryStates {
  String loadingMessage = 'Loading....';

  CategoryLoadingState({required this.loadingMessage});
}

class CategoryErrorState extends CategoryStates {
  Failures failures;
  CategoryErrorState({required this.failures});
}

class CategorySuccessState extends CategoryStates {
  AllCategoriesEntity categoryEntity;
  CategorySuccessState({required this.categoryEntity});
}
class BrandsSuccessState extends CategoryStates {
  BrandsResponseEntity brandsEntity;
  BrandsSuccessState({required this.brandsEntity});
}