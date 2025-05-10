import 'package:ecommerce_app_v2/UI/core/widget/product_item.dart';
import 'package:ecommerce_app_v2/UI/tabs/product-tab/cubit/product_states.dart';
import 'package:ecommerce_app_v2/UI/tabs/product-tab/cubit/product_view_model.dart';
import 'package:ecommerce_app_v2/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductTab extends StatelessWidget {
  ProductTab({super.key});

  ProductViewModel viewModel = getIt<ProductViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductViewModel,ProductStates>(
      bloc: viewModel..getAllProducts(),
      builder: (context, state) {
        if (state is ProductLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20.h,
                crossAxisSpacing: 16.w),
            itemBuilder: (context, index) => ProductItem(item: viewModel.allProducts[index],), itemCount: viewModel.allProducts.length ,),
        );
      },
    );
  }
}
