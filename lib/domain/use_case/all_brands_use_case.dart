import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_v2/domain/entities/BrandsResponseEntity.dart';
import 'package:injectable/injectable.dart';

import '../failures.dart';
import '../repository/home_repository.dart';

@injectable
class AllBrandsUseCase {
  HomeRepository allBrandsRepository;

  AllBrandsUseCase({required this.allBrandsRepository});

  Future<Either<Failures, BrandsResponseEntity>> invoke(){
    return allBrandsRepository.getAllBrands();
  }
}