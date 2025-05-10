import 'package:ecommerce_app_v2/UI/tabs/product-tab/cubit/product_states.dart';
import 'package:ecommerce_app_v2/domain/entities/ProductsEntity.dart';
import 'package:ecommerce_app_v2/domain/use_case/product_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductViewModel extends Cubit<ProductStates> {
  // todo hold data - handle logic
  ProductUseCase productUseCase ;

  ProductViewModel({required this.productUseCase}) : super(ProductInitialState());
  List<DataProductEntity> allProducts = [];

  static ProductViewModel get(context) => BlocProvider.of(context);

  Future<void> getAllProducts() async {
    emit(ProductLoadingState(loadingMessage: 'Loading ...'));
    var result = await productUseCase.invoke();
    result.fold((error) {
      emit(ProductErrorState(failures: error));
    }, (response) {
      allProducts = response.data ?? [];
      emit(ProductSuccessState(productsEntity: response));
    });
  }
}
