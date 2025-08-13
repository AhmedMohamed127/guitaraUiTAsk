import '../../domain/entities/product.dart';

class ProductModel extends Product {
  const ProductModel({
    required super.category,
    required super.title,
    required super.price,
    required super.imagePath,
    required super.isFavorite,
  });

  Product toEntity() => Product(
        category: category,
        title: title,
        price: price,
        imagePath: imagePath,
        isFavorite: isFavorite,
      );
}


