import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failure.dart';

import '../entities/add_product_entity.dart';

abstract class ProductsRepo {
  Future<Either<Failure, void>> addProducts(AddProductEntity addProductEntity);
}