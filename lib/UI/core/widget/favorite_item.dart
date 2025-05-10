import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app_v2/domain/entities/ProductsEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../product_screen/product_screen.dart';
import '../reusable_component/app_assets.dart';
import '../reusable_component/app_colors.dart';
import '../reusable_component/app_styles.dart';
import 'custom_elevated_button.dart';

class FavoriteItem extends StatefulWidget {
  final DataProductEntity item;

  const FavoriteItem({Key? key, required this.item}) : super(key: key);

  @override
  State<FavoriteItem> createState() => _FavoriteItemState();
}

class _FavoriteItemState extends State<FavoriteItem> {
  String heartIcon = AppAssets.selectedFavouriteIcon;

  @override
  Widget build(BuildContext context) {
    var item = widget.item;
    return InkWell(
      onTap: () {
      Navigator.pushReplacementNamed(context, ProductDetailsScreen.routeName,
          arguments: widget.item as DataProductEntity);
    },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 136.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              color: AppColors.primaryColor.withOpacity(.3),
            ),
          ),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(
                    color: AppColors.primaryColor.withOpacity(.6),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: CachedNetworkImage(
                    width: 120.w,
                    height: 135.h,
                    fit: BoxFit.cover,
                    imageUrl: item.imageCover ?? "",
                    placeholder: (context, url) =>
                    const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                    const Icon(
                      Icons.error,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: 8.w, bottom: 8.h, left: 8.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AutoSizeText(
                            item.title ?? 'No name',
                            style: AppStyles.medium18Header,
                          ),
                         Icon(Icons.favorite_rounded, color: AppColors.primaryColor,)
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 10.w),
                            width: 14.w,
                            height: 14.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          AutoSizeText(
                            "EGP ${item.price}",
                            style: AppStyles.medium18Header,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          AutoSizeText(
                            "EGP ${item.price! * 2}",
                            style: AppStyles.regular11SalePrice.copyWith(
                                decoration: TextDecoration.lineThrough),
                          ),
                          const Spacer(),
                          SizedBox(
                            width: 100.w,
                            height: 36.h,
                            child: CustomElevatedButton(
                              text: "Add To Cart",
                              onPressed: () {},
                              backgroundColor: AppColors.primaryColor,
                              textStyle: AppStyles.medium14Category
                                  .copyWith(color: AppColors.whiteColor),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

