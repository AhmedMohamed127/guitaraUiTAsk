import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/assets.dart';
import '../../../bike_shop/data/datasources/product_local_data_source.dart';
import '../../../bike_shop/data/repositories/product_repository_impl.dart';
import '../../../bike_shop/domain/entities/product.dart';
import '../../../bike_shop/domain/usecases/get_products.dart';
import '../widgets/bottom_nav.dart';
import '../widgets/product_card.dart';

class BikeCatalogPage extends StatefulWidget {
  const BikeCatalogPage({super.key});

  @override
  State<BikeCatalogPage> createState() => _BikeCatalogPageState();
}

class _BikeCatalogPageState extends State<BikeCatalogPage> {
  late final GetProducts _getProducts;

  @override
  void initState() {
    super.initState();
    final ds = ProductLocalDataSourceImpl();
    final repo = ProductRepositoryImpl(ds);
    _getProducts = GetProducts(repo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65.h),
        child: AppBar(
          backgroundColor: AppColors.background,
          elevation: 0,
          titleSpacing: 20.w,
          title: Text(
            'Choose Your Bike',
            style: TextStyle(color: Colors.white, fontSize: 24.sp, fontWeight: FontWeight.bold),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [AppColors.gradientStart, AppColors.gradientEnd]),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Icon(Icons.search, color: Colors.white, size: 23.sp),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          // Background image overlaid by solid background color
          Positioned.fill(
            child: Container(
              alignment: Alignment.bottomCenter,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppAssets.bg),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              children: [
                SizedBox(height: 10.h),
                _FeaturedCard(),
                SizedBox(height: 20.h),
                _StaggeredChipsRow(),
                SizedBox(height: 20.h),
                FutureBuilder<List<Product>>(
                  future: _getProducts(),
                  builder: (context, snapshot) {
                    final items = snapshot.data ?? const <Product>[];
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: items.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.8,
                        crossAxisSpacing: 15.w,
                        mainAxisSpacing: 15.h,
                      ),
                      itemBuilder: (context, index) => ProductCard(product: items[index]),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Choose Your Bike',
            style: TextStyle(color: Colors.white, fontSize: 24.sp, fontWeight: FontWeight.bold),
          ),
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [AppColors.gradientStart, AppColors.gradientEnd]),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(Icons.search, color: Colors.white, size: 30.sp),
          ),
        ],
      ),
    );
  }
}

class _FeaturedCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.r),
      child: AspectRatio(
        aspectRatio: 335 / 210, // responsive banner ratio
        child: Image.asset(
          AppAssets.topCard,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _StaggeredChipsRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Staggered vertical offsets (first is lowest)
    final List<double> offsets = [0, 10, 20, 30, 40];

    final items = <Widget>[
      _SquareChip(
        child: Text('All', style: TextStyle(color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.w600)),
        gradient: const LinearGradient(colors: [AppColors.gradientStart, AppColors.gradientEnd]),
      ),
      _SquareChip(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.r),
          child: Image.asset(AppAssets.battery, fit: BoxFit.cover),
        ),
      ),
      _SquareChip(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.r),
          child: Image.asset(AppAssets.road, fit: BoxFit.cover),
        ),
      ),
      _SquareChip(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.r),
          child: Image.asset(AppAssets.union, fit: BoxFit.cover),
        ),
      ),
      _SquareChip(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.r),
          child: Image.asset(AppAssets.union2, fit: BoxFit.cover),
        ),
      ),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final gap = 12.w;
        final count = items.length;
        final itemSide = (constraints.maxWidth - (gap * (count - 1))) / count;
        return Row(
          children: [
            for (int i = 0; i < count; i++) ...[
              Transform.translate(
                offset: Offset(0, -offsets[i].h),
                child: SizedBox(
                  width: itemSide,
                  height: itemSide,
                  child: items[i],
                ),
              ),
              if (i < count - 1) SizedBox(width: gap),
            ]
          ],
        );
      },
    );
  }
}

class _SquareChip extends StatelessWidget {
  final Widget child;
  final Gradient? gradient;
  const _SquareChip({required this.child, this.gradient});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: gradient ?? const LinearGradient(colors: [Color(0xFF2B3548), Color(0xFF3B4760)]),
        borderRadius: BorderRadius.circular(12.r),
      ),
      alignment: Alignment.center,
      child: child,
    );
  }
}

// Reserved for future use if we need a circular image chip again



