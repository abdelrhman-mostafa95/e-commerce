import 'package:ecommerce_app_v2/domain/entities/AllCategoriesEntity.dart';
import 'package:ecommerce_app_v2/domain/use_case/all_brands_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entities/BrandsResponseEntity.dart';
import '../../../../domain/use_case/all_categories_use_case.dart';
import 'home_tab_states.dart';

@injectable
class HomeTabViewModel extends Cubit<CategoryStates> {
  AllCategoriesUseCase allCategoriesUseCase;
  AllBrandsUseCase allBrandsUseCase;
  List<String> images = [
    'assets/images/banner-1.png',
    'assets/images/banner-2.png',
    'assets/images/banner-3.png',
  ];

  HomeTabViewModel({required this.allCategoriesUseCase, required this.allBrandsUseCase})
      : super(CategoryStates());
  List<DataEntity> allCategories = [];
  List<DataBrandsEntity> allBrands = [];

  Future<void> getAllCategories() async {
    emit(CategoryLoadingState(loadingMessage: 'Loading ...'));
    var result = await allCategoriesUseCase.invoke();
    result.fold((error) {
      emit(CategoryErrorState(failures: error));
    }, (response) {
      allCategories = response.data!;
      emit(CategorySuccessState(categoryEntity: response));
    });
  }
  Future<void> getAllBrands() async {
    emit(CategoryLoadingState(loadingMessage: 'Loading ...'));
    var result = await allBrandsUseCase.invoke();
    result.fold((error) {
      emit(CategoryErrorState(failures: error));
    }, (responseBrands) {
      allBrands = responseBrands.data!;
      emit(BrandsSuccessState(brandsEntity: responseBrands));
    });
  }
}
