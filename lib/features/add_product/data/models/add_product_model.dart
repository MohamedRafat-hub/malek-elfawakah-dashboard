import 'package:fruits_hub_dashboard/features/add_product/domain/entities/add_product_entity.dart';

class AddProductModel {
  final String name;
  final String code;
  final String description;
  final num price;
  final String imageUrl;
  final bool isFeatured;
  final int expirationMonths;
  final int numberOfCalories;
  final int unitAmount;
  bool isOrganic;

  AddProductModel({
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.isFeatured,
    required this.expirationMonths,
    required this.numberOfCalories,
    required this.unitAmount,
    this.isOrganic = false,
  });

  factory AddProductModel.fromEntity(AddProductEntity entity) {
    return AddProductModel(
      name: entity.name,
      code: entity.code,
      description: entity.description,
      price: entity.price,
      imageUrl: entity.imageUrl ?? '',
      isFeatured: entity.isFeatured,
      expirationMonths: entity.expirationMonths,
      numberOfCalories: entity.numberOfCalories,
      unitAmount: entity.unitAmount,
      isOrganic: entity.isOrganic,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'code': code,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'isFeatured': isFeatured,
      'expirationMonths': expirationMonths,
      'numberOfCalories': numberOfCalories,
      'unitAmount': unitAmount,
      'isOrganic': isOrganic,
    };
  }
}
