import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'features/bike_shop/presentation/pages/bike_catalog_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // your design reference
      minTextAdapt: true,
      splitScreenMode: true,
      // pass your top-level screen as `child`
      child: const BikeCatalogPage(),
      builder: (context, child) {
        // return MaterialApp and use `child` as the home
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Bike Shop',
          home: child,
        );
      },
    );
  }
}
