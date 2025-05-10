import 'package:dartz/dartz.dart';
import 'package:ecommerce_app_v2/data/data_sources/all_categories_data_source/Home_remote_data_source.dart';
import 'package:ecommerce_app_v2/domain/entities/AllCategoriesEntity.dart';
import 'package:ecommerce_app_v2/domain/entities/BrandsResponseEntity.dart';
import 'package:ecommerce_app_v2/domain/entities/ProductsEntity.dart';
import 'package:ecommerce_app_v2/domain/failures.dart';
import 'package:ecommerce_app_v2/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  HomeRemoteDataSource homeRemoteDataSource;

  HomeRepositoryImpl(this.homeRemoteDataSource);

  @override
  Future<Either<Failures, AllCategoriesEntity>> getAllCategories() async {
    var either = await homeRemoteDataSource.getAllCategories();
    return either.fold(
      (l) => Left(l),
      (response) => Right(response),
    );
  }

  @override
  Future<Either<Failures, BrandsResponseEntity>> getAllBrands() async{
    var either = await homeRemoteDataSource.getAllBrands();
    return either.fold(
          (l) => Left(l),
          (response) => Right(response),
    );
  }

  @override
  Future<Either<Failures, ProductsEntity>> getAllProducts() async{
    var either = await homeRemoteDataSource.getAllProducts();
    return either.fold(
          (l) => Left(l),
          (response) => Right(response),
    );
  }
}
