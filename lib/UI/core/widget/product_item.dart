import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app_v2/UI/product_screen/product_screen.dart';
import 'package:ecommerce_app_v2/domain/entities/ProductsEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../favorite_provider.dart';
import '../reusable_component/app_colors.dart';
import '../reusable_component/app_styles.dart';
import 'custom_txt.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatefulWidget {
  DataProductEntity item;

  ProductItem({required this.item});

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthUserProvider>(context);
    print(widget.item.images?[0]);
    return InkWell(
      onTap: () {
        Navigator.pushReplacementNamed(context, ProductDetailsScreen.routeName,
            arguments: widget.item as DataProductEntity);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: AppColors.primary30Opacity, width: 2),
        ),
        child: Column(
          children: [
            // Image + Favorite Button
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.r),
                topRight: Radius.circular(15.r),
              ),
              child: Stack(
                children: [
                  CachedNetworkImage(
                    width: double.infinity,
                    height: 100.h,
                    fit: BoxFit.cover,
                    imageUrl: widget.item.imageCover ?? "",
                    scale: 20,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(
                          color: AppColors.primaryDark),
                    ),
                    errorWidget: (context, url, error) => const Icon(
                      Icons.error,
                      color: AppColors.redColor,
                    ),
                  ),
                  Positioned(
                    top: 8.h,
                    right: 8.w,
                    child: CircleAvatar(
                      backgroundColor: AppColors.whiteColor,
                      radius: 18.r,
                      child: Consumer<FavoriteProvider>(
                        builder: (context, favoriteProvider, child) {
                          bool isFavorite =
                              authProvider.isFavorite(widget.item);
                          return CircleAvatar(
                            backgroundColor: AppColors.whiteColor,
                            radius: 18.r,
                            child: IconButton(
                              onPressed: () {
                                authProvider.toggleFavorite(widget.item);
                              },
                              icon: isFavorite
                                  ? Icon(Icons.favorite_rounded)
                                  : Icon(Icons.favorite_border_rounded),
                              iconSize: 20.r,
                              padding: EdgeInsets.zero,
                              color: AppColors.primaryColor,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Content Area
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTxt(text: (widget.item.title ?? ""), fontSize: 12.sp),
                    SizedBox(height: 2.h),
                    Row(
                      children: [
                        CustomTxt(text: "EGP ${widget.item.price!}"),
                        SizedBox(width: 4.w),
                        CustomTxt(
                          text: "EGP ${widget.item.price! * 2}",
                          textStyle: AppStyles.regular11SalePrice.copyWith(
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        CustomTxt(
                            text:
                                "Review (${widget.item.ratingsAverage ?? ""})",
                            fontSize: 12.sp),
                        Icon(Icons.star,
                            color: AppColors.yellowColor, size: 18.sp),
                        Spacer(),
                        InkWell(
                          onTap: () {},
                          child: Icon(Icons.add_circle,
                              size: 26.sp, color: AppColors.primaryColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
