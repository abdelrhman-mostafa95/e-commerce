import 'package:ecommerce_app_v2/domain/entities/ProductsEntity.dart';

import '../../../../domain/failures.dart';

class ProductStates {}

class ProductInitialState extends ProductStates {}
class ProductLoadingState extends ProductStates {
  String loadingMessage = 'Loading....';
  ProductLoadingState({required this.loadingMessage});
}
class ProductErrorState extends ProductStates {
  Failures failures;
  ProductErrorState({required this.failures});
}
class ProductSuccessState extends ProductStates {
  ProductsEntity productsEntity;
  ProductSuccessState({required this.productsEntity});
}