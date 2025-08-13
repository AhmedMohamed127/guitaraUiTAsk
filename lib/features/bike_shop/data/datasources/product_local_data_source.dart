import '../models/product_model.dart';
import '../../../../core/constants/assets.dart';

abstract class ProductLocalDataSource {
  Future<List<ProductModel>> fetchProducts();
}

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  const ProductLocalDataSourceImpl();

  @override
  Future<List<ProductModel>> fetchProducts() async {
    // Simulated local list
    return const [
      ProductModel(
        category: 'Road Bike',
        title: 'PEUGEOT - LR01',
        price: r'$ 1,999.99',
        imagePath: AppAssets.bike,
        isFavorite: true,
      ),
      ProductModel(
        category: 'Road Helmet',
        title: 'SMITH - Trade',
        price: r'$ 120',
        imagePath: AppAssets.image,
        isFavorite: false,
      ),
      ProductModel(
        category: 'Mountain Bike',
        title: 'TREK - X1',
        price: r'$ 2,499.99',
        imagePath: AppAssets.bike,
        isFavorite: true,
      ),
      ProductModel(
        category: 'Bike Accessories',
        title: 'Various Items',
        price: r'$ 99.99',
        imagePath: AppAssets.bike,
        isFavorite: false,
      ),
    ];
  }
}


