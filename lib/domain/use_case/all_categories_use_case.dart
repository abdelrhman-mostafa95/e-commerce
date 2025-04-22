import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_v2/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

import '../entities/AllCategoriesEntity.dart';
import '../failures.dart';

@injectable
class AllCategoriesUseCase {
  HomeRepository allCategoriesRepository;

  AllCategoriesUseCase({required this.allCategoriesRepository});

   Future<Either<Failures, AllCategoriesEntity>> invoke(){
    return allCategoriesRepository.getAllCategories();
   }
}