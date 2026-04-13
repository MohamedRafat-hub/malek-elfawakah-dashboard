import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failure.dart';
import 'package:fruits_hub_dashboard/core/services/database_service.dart';
import 'package:fruits_hub_dashboard/features/add_product/data/models/add_product_model.dart';
import 'package:fruits_hub_dashboard/features/add_product/domain/entities/add_product_entity.dart';

import '../../domain/repos/products_repo.dart';

class ProductsRepoImpl implements ProductsRepo {
  final DatabaseService databaseService;

  ProductsRepoImpl(this.databaseService);

  @override
  Future<Either<Failure, void>> addProducts(
    AddProductEntity addProductEntity,
  ) async {
    try {
      final data = await databaseService.addData(
        collectionName: 'products',
        data: AddProductModel.fromEntity(addProductEntity).toMap(),
      );
      return right(null);
    } catch (e) {
      return left(ServerFailure('Failed to add product'));
    }
  }
}
