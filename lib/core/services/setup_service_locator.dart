import 'package:get_it/get_it.dart';

import 'fire_storage.dart';

GetIt getIt = GetIt.instance;

void setupServiceLocator()
{
  getIt.registerSingleton(FireStorage());
}
