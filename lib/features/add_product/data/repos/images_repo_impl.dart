import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failure.dart';
import 'package:fruits_hub_dashboard/features/add_product/domain/repos/images_repo.dart';

class ImagesRepoImpl implements ImagesRepo{
  @override
  Future<Either<Failure, void>> uploadImage(File image) {
    // TODO: implement uploadImage
    throw UnimplementedError();
  }
}