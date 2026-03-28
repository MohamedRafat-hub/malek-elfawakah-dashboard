import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failure.dart';

abstract class ImagesRepo {
  Future<Either<Failure,void>> uploadImage(File image);
}
