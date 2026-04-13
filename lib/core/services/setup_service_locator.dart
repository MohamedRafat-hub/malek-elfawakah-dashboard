import 'package:fruits_hub_dashboard/core/services/cloudinary_service.dart';
import 'package:fruits_hub_dashboard/core/services/database_service.dart';
import 'package:fruits_hub_dashboard/core/services/firestore_service.dart';
import 'package:fruits_hub_dashboard/core/services/storage_service.dart';
import 'package:fruits_hub_dashboard/features/add_product/data/repos/images_repo_impl.dart';
import 'package:fruits_hub_dashboard/features/add_product/data/repos/products_repo_impl.dart';
import 'package:fruits_hub_dashboard/features/add_product/domain/repos/images_repo.dart';
import 'package:fruits_hub_dashboard/features/add_product/domain/repos/products_repo.dart';
import 'package:get_it/get_it.dart';

import 'fire_storage.dart';

GetIt getIt = GetIt.instance;

void setupServiceLocator()
{
  getIt.registerSingleton<StorageService>(CloudinaryService());
  getIt.registerSingleton<ImagesRepo>(ImagesRepoImpl(getIt.get<StorageService>()));
  getIt.registerSingleton<DatabaseService>(FireStoreService());
  getIt.registerSingleton<ProductsRepo>(ProductsRepoImpl(getIt.get<DatabaseService>()));
}
