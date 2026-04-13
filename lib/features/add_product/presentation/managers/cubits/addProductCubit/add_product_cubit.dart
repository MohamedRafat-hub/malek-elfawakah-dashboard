
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:fruits_hub_dashboard/features/add_product/domain/entities/add_product_entity.dart';
import 'package:fruits_hub_dashboard/features/add_product/domain/repos/images_repo.dart';
import 'package:fruits_hub_dashboard/features/add_product/domain/repos/products_repo.dart';
import 'package:meta/meta.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit({required this.imagesRepo, required this.productsRepo})
    : super(AddProductInitial());
  final ImagesRepo imagesRepo;
  final ProductsRepo productsRepo;

  Future<void> addProduct(AddProductEntity entity) async {
    emit(AddProductLoading());
    var result = await imagesRepo.uploadImage(entity.image);

    result.fold(
      (error) {
          log('error message from upload image is : $error.message');
        emit(AddProductFailure(error.message));
      },
      (url) async {
        entity.imageUrl = url;
        var result = await productsRepo.addProducts(entity);
        result.fold(
          (error) {
            log('error message from add the product is : $error.message');
            emit(AddProductFailure(error.message));
          },
          (success) {
            emit(AddProductSuccess());
          },
        );
      },
    );
  }
}
