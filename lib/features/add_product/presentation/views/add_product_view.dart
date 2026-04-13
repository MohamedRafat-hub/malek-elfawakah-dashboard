import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/services/setup_service_locator.dart';
import 'package:fruits_hub_dashboard/core/utils/app_colors.dart';
import 'package:fruits_hub_dashboard/features/add_product/domain/repos/images_repo.dart';
import 'package:fruits_hub_dashboard/features/add_product/domain/repos/products_repo.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/managers/cubits/addProductCubit/add_product_cubit.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/widgets/add_product_view_body.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  static const routeName = 'add-product';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Add Product',
          style: TextStyle(color: AppColors.primaryColor),
        ),
      ),
      body: BlocProvider(
        create: (context) => AddProductCubit(imagesRepo: getIt.get<ImagesRepo>(), productsRepo: getIt.get<ProductsRepo>()),
        child: AddProductViewBody(),
      ),
    );
  }
}
