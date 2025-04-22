import 'package:ecommerce_app_v2/UI/tabs/home_tab/cubit/home_tab_states.dart';
import 'package:ecommerce_app_v2/UI/tabs/home_tab/cubit/home_tab_view_model.dart';
import 'package:ecommerce_app_v2/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../domain/entities/AllCategoriesEntity.dart';
import '../../../domain/entities/BrandsResponseEntity.dart';
import '../../core/reusable_component/app_colors.dart';
import '../../core/reusable_component/app_styles.dart';
import '../../core/widget/brand_item.dart';
import '../../core/widget/category_item.dart';

class HomeTab extends StatelessWidget {

  HomeTabViewModel viewModel = getIt<HomeTabViewModel>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 16.h,
            ),
            _buildAnnouncement(images: viewModel.images),
            SizedBox(
              height: 24.h,
            ),
            _lineBreak(name: "Categories"),
            BlocBuilder<HomeTabViewModel, CategoryStates>(
              bloc: viewModel..getAllCategories(),
              builder: (context, state) {
                return viewModel.allCategories.isEmpty
                    ? const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                )
                    : _buildCategorySec(list: viewModel.allCategories);
              },
            ),
            // child: _buildCategoryBrandSec(const CategoryBrandItem())),
            _lineBreak(name: "Brands"),
            BlocBuilder<HomeTabViewModel, CategoryStates>(
              bloc: viewModel..getAllBrands(),
              builder: (context, state) {
                return viewModel.allBrands.isEmpty
                    ? const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                )
                    : _buildBrandSec(list: viewModel.allBrands);
              },
            )
          ],
        ),
      ),
    );
  }

  SizedBox _buildCategorySec({required List<DataEntity> list}) {
    return SizedBox(
      height: 250.h,
      width: double.infinity,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 16.h, crossAxisSpacing: 16.w),
        itemCount: list.length,
        scrollDirection: Axis.horizontal,
        physics: const ScrollPhysics(),
        itemBuilder: (context, index) {
          return CategoryItem(item: list[index]);
        },
      ),
    );
  }
  SizedBox _buildBrandSec({required List<DataBrandsEntity> list}) {
    return SizedBox(
      height: 250.h,
      width: double.infinity,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 16.h, crossAxisSpacing: 16.w),
        itemCount: list.length,
        scrollDirection: Axis.horizontal,
        physics: const ScrollPhysics(),
        itemBuilder: (context, index) {
          return BrandItem(item: list[index]);
        },
      ),
    );
  }

  ImageSlideshow _buildAnnouncement({
    required List<String> images,
  }) {
    return ImageSlideshow(
        indicatorColor: AppColors.primaryColor,
        initialPage: 0,
        indicatorBottomPadding: 15.h,
        indicatorPadding: 8.w,
        indicatorRadius: 5,
        indicatorBackgroundColor: AppColors.whiteColor,
        isLoop: true,
        autoPlayInterval: 3000,
        height: 190.h,
        children: images.map((url) {
          return Image.asset(
            url,
            fit: BoxFit.fill,
          );
        }).toList());
  }

  Widget _lineBreak({required String name}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(name, style: AppStyles.medium18Header),
        TextButton(
          onPressed: () {
            //todo: navigate to all
          },
          child: Text("View All", style: AppStyles.regular12Text),
        )
      ],
    );
  }
}
