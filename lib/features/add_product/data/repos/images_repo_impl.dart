import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failure.dart';
import 'package:fruits_hub_dashboard/core/services/fire_storage.dart';
import 'package:fruits_hub_dashboard/core/utils/end_points.dart';
import 'package:fruits_hub_dashboard/features/add_product/domain/repos/images_repo.dart';

class ImagesRepoImpl implements ImagesRepo{
  final FireStorage fireStorage;

  ImagesRepoImpl(this.fireStorage);

  @override
  Future<Either<Failure, String>> uploadImage(File image) async {
    try {
      String url = await fireStorage.uploadImage(image, EndPoints.path);
      return right(url);
    } catch (e) {
      return left(ServerFailure('failure to upload image'));
    }
  }
}