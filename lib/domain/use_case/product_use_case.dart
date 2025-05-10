import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_v2/domain/entities/ProductsEntity.dart';
import 'package:ecommerce_app_v2/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

import '../failures.dart';

@injectable
class ProductUseCase {
  HomeRepository productRepository;
  ProductUseCase({required this.productRepository});
  Future<Either<Failures, ProductsEntity>> invoke() {
    return productRepository.getAllProducts();
  }
}