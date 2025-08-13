import '../entities/product.dart';
import '../repositories/product_repository.dart';

class GetProducts {
  final ProductRepository repository;

  const GetProducts(this.repository);

  Future<List<Product>> call() => repository.getProducts();
}


