import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_v2/domain/entities/AllCategoriesEntity.dart';
import 'package:ecommerce_app_v2/domain/entities/BrandsResponseEntity.dart';
import 'package:ecommerce_app_v2/domain/entities/ProductsEntity.dart';
import '../failures.dart';


abstract class HomeRepository {
  Future<Either<Failures, AllCategoriesEntity>> getAllCategories();
  Future<Either<Failures, BrandsResponseEntity>> getAllBrands();
  Future<Either<Failures, ProductsEntity>> getAllProducts();
}