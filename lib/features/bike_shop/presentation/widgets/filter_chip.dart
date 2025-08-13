import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';

class BikeFilterChip extends StatelessWidget {
  final bool isSelected;
  final String iconPath;
  const BikeFilterChip({super.key, required this.isSelected, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 28.h),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: isSelected
                  ? const [Color(0xFF4A9EFF), AppColors.gradientEnd]
                  : const [AppColors.cardDark, Color(0xFF353F54)],
            ),
            borderRadius: BorderRadius.circular(20.r),
          ),
        ),
        Image.asset(iconPath, width: 35.w, height: 35.h, fit: BoxFit.cover),
      ],
    );
  }
}


