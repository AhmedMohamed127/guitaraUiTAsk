import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).padding.bottom;
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.background,
        border: Border(top: BorderSide(color: Color(0xFF2D2D4A), width: 0.5)),
      ),
      padding: EdgeInsets.only(
        left: 12.w,
        right: 12.w,
        top: 8.h,
        bottom: (8.h + bottomInset),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          _BottomNavItem(icon: Icons.directions_bike, isSelected: true),
          _BottomNavItem(icon: Icons.map_outlined, isSelected: false),
          _BottomNavItem(icon: Icons.shopping_cart_outlined, isSelected: false),
          _BottomNavItem(icon: Icons.person_outline, isSelected: false),
          _BottomNavItem(icon: Icons.description_outlined, isSelected: false),
        ],
      ),
    );
  }
}

class _BottomNavItem extends StatelessWidget {
  final IconData icon;
  final bool isSelected;

  const _BottomNavItem({required this.icon, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF4A9EFF) : Colors.transparent,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Icon(icon, color: isSelected ? Colors.white : Colors.white54, size: 22.sp),
    );
  }
}


