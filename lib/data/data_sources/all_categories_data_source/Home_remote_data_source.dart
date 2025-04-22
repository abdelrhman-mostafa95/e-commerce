import 'package:dartz/dartz.dart';

import '../../../domain/entities/AllCategoriesEntity.dart';
import '../../../domain/entities/BrandsResponseEntity.dart';
import '../../../domain/failures.dart';

abstract class HomeRemoteDataSource {
  Future<Either<Failures, AllCategoriesEntity>> getAllCategories();
  Future<Either<Failures, BrandsResponseEntity>> getAllBrands();
}