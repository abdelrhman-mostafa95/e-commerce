import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_v2/domain/entities/ProductsEntity.dart';

import '../../../domain/entities/AllCategoriesEntity.dart';
import '../../../domain/entities/BrandsResponseEntity.dart';
import '../../../domain/failures.dart';

abstract class HomeRemoteDataSource {
  Future<Either<Failures, AllCategoriesEntity>> getAllCategories();
  Future<Either<Failures, BrandsResponseEntity>> getAllBrands();
  Future<Either<Failures, ProductsEntity>> getAllProducts();
}