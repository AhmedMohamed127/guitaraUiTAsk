import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BikeShoppingScreen extends StatelessWidget {
  const BikeShoppingScreen({Key? key}) : super(key: key);

  static const Color backgroundColor = Color(0xFF1E1E2E);
  static const Color cardDark = Color(0xFF222834);
  static const Color gradientStart = Color(0xFF34C8E8);
  static const Color gradientEnd = Color(0xFF4E4AF2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const _Header(),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/BG.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 10.h),
                      const _FeaturedBikeCard(),
                      SizedBox(height: 20.h),
                      const _FilterChipsRow(),
                      SizedBox(height: 20.h),
                      _ProductsGrid(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const _BottomNavBar(),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Choose Your Bike',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [BikeShoppingScreen.gradientStart, BikeShoppingScreen.gradientEnd],
              ),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(Icons.search, color: Colors.white, size: 30.sp),
          ),
        ],
      ),
    );
  }
}

class _FeaturedBikeCard extends StatelessWidget {
  const _FeaturedBikeCard();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.r),
      child: Image.asset(
        'assets/images/TopCard.png',
        width: double.infinity,
        height: 300.h,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}

class _FilterChipsRow extends StatelessWidget {
  const _FilterChipsRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        _FilterChip(isSelected: true, label: '', iconPath: 'assets/images/Bicycle.png'),
        SizedBox(width: 12),
        _FilterChip(isSelected: false, label: '', iconPath: 'assets/images/batt.png'),
        SizedBox(width: 12),
        _FilterChip(isSelected: false, label: '', iconPath: 'assets/images/batt.png'),
        SizedBox(width: 12),
        _FilterChip(isSelected: false, label: '', iconPath: 'assets/images/batt.png'),
        SizedBox(width: 12),
        _FilterChip(isSelected: false, label: '', iconPath: 'assets/images/batt.png'),
      ],
    );
  }
}

class _FilterChip extends StatelessWidget {
  final bool isSelected;
  final String label;
  final String iconPath;

  const _FilterChip({
    required this.isSelected,
    required this.label,
    required this.iconPath,
  });

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
                  ? [const Color(0xFF4A9EFF), const Color(0xFF4E4AF2)]
                  : [const Color(0xFF222834), const Color(0xFF353F54)],
            ),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ),
        Image.asset(iconPath, width: 35.w, height: 35.h,
        fit: BoxFit.cover,),
      ],
    );
  }
}

class _ProductsGrid extends StatelessWidget {
  final products = const [
    Product('Road Bike', 'PEUGEOT - LR01', '\$ 1,999.99', 'assets/images/bike.png', true),
    Product('Road Helmet', 'SMITH - Trade', '\$ 120', 'assets/images/Image.png', false),
    Product('Mountain Bike', 'TREK - X1', '\$ 2,499.99', 'assets/images/bike.png', true),
    Product('Bike Accessories', 'Various Items', '\$ 99.99', 'assets/images/bike.png', false),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        crossAxisSpacing: 15.w,
        mainAxisSpacing: 15.h,
      ),
      itemBuilder: (context, index) => _ProductCard(product: products[index]),
    );
  }
}

class Product {
  final String category;
  final String title;
  final String price;
  final String imagePath;
  final bool isFavorite;

  const Product(this.category, this.title, this.price, this.imagePath, this.isFavorite);
}

class _ProductCard extends StatelessWidget {
  final Product product;

  const _ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [BikeShoppingScreen.cardDark, BikeShoppingScreen.cardDark.withOpacity(0.7)],
        ),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                Text(product.category, style: TextStyle(color: Colors.white70, fontSize: 12.sp)),
                SizedBox(height: 4.h),
                Text(product.title, style: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.bold)),
                SizedBox(height: 4.h),
                Text(product.price, style: TextStyle(color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
          Positioned(
            top: 20.h,
            right: 12.w,
            child: Icon(Icons.favorite_border, color: product.isFavorite ? Colors.white70 : Colors.blue, size: 20.sp),
          ),
          Positioned(
            right: 15.w,
            top: 10.h,
            child: Image.asset(product.imagePath, width: 150.w, height: 150.h),
          ),
        ],
      ),
    );
  }
}

class _BottomNavBar extends StatelessWidget {
  const _BottomNavBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      decoration: const BoxDecoration(
        color: BikeShoppingScreen.backgroundColor,
        border: Border(top: BorderSide(color: Color(0xFF2D2D4A), width: 0.5)),
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
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF4A9EFF) : Colors.transparent,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Icon(icon, color: isSelected ? Colors.white : Colors.white54, size: 24.sp),
    );
  }
}
