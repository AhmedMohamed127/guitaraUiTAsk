import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/shapes/two_cut_corners_border.dart';
import '../../../bike_shop/domain/entities/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final shape = TwoCutCornersBorder(cutSize: 18.r, otherCornerRadius: 22.r);

    return Material(
      color: Colors.transparent,
      elevation: 2,
      shape: shape,
      clipBehavior: Clip.antiAlias,
      child: ClipPath(
        clipper: ShapeBorderClipper(shape: shape),
        child: Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.cardDark.withOpacity(0.95),
                AppColors.cardDark.withOpacity(0.7),
              ],
            ),
          ),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(15.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    Text(
                      product.category,
                      style: TextStyle(color: Colors.white70, fontSize: 12.sp),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      product.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      product.price,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 20.h,
                right: 12.w,
                child: Icon(
                  Icons.favorite_border,
                  color: product.isFavorite ? Colors.white70 : Colors.blue,
                  size: 20.sp,
                ),
              ),
              Positioned(
                right: 15.w,
                top: 10.h,
                child: Transform.rotate(
                  angle: -0.07, // slight tilt
                  child: Image.asset(product.imagePath, width: 150.w, height: 150.h),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


