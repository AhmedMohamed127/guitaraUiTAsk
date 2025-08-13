import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/product_local_data_source.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductLocalDataSource localDataSource;

  const ProductRepositoryImpl(this.localDataSource);

  @override
  Future<List<Product>> getProducts() async {
    final models = await localDataSource.fetchProducts();
    return models.map((m) => m.toEntity()).toList();
  }
}


