import 'dart:io';

class AddProductEntity {
  final String name;
  final num price;
  final String code;
  final String description;
  final bool isFeatured;
  final File image;
  String? imageUrl;
  final int expirationMonths;
  final int numberOfCalories;
  final int unitAmount;
  bool isOrganic;

  AddProductEntity({
    required this.name,
    required this.price,
    required this.code,
    required this.description,
    required this.isFeatured,
    required this.image,
    this.imageUrl,
    required this.expirationMonths,
    required this.numberOfCalories,
    required this.unitAmount,
    this.isOrganic = false,
  });
}
