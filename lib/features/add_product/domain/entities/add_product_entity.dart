import 'dart:io';

class AddProductEntity {
  final String name;
  final num price;
  final String code;
  final String description;
  final bool isFeatured;
  final File image;
  final String? imageUrl;

  AddProductEntity({
    required this.name,
    required this.price,
    required this.code,
    required this.description,
    required this.isFeatured,
    required this.image,
    this.imageUrl,
  });
}
