import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failure.dart';
import 'package:fruits_hub_dashboard/core/services/storage_service.dart';
import 'package:fruits_hub_dashboard/core/utils/end_points.dart';
import 'package:fruits_hub_dashboard/features/add_product/domain/repos/images_repo.dart';

class ImagesRepoImpl implements ImagesRepo{
  final StorageService storageService;

  ImagesRepoImpl(this.storageService);

  @override
  Future<Either<Failure, String>> uploadImage(File image) async {
    try {
      String url = await storageService.uploadImage(image, EndPoints.path);
      return right(url);
    } catch (e) {
      return left(ServerFailure('failure to upload image'));
    }
  }
}