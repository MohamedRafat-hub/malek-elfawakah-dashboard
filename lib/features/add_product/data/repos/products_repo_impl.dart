import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failure.dart';
import 'package:fruits_hub_dashboard/features/add_product/domain/entities/add_product_entity.dart';

import '../../domain/repos/products_repo.dart';

class ProductsRepoImpl implements ProductsRepo {
  @override
  Future<Either<Failure,void>> addProducts(AddProductEntity addProductEntity) {
    // TODO: implement addProducts
    throw UnimplementedError();
  }
 }