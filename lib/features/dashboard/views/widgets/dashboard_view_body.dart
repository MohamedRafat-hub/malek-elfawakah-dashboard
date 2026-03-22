import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_material_button.dart';
import '../../../add_product/presentation/views/add_product_view.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomMaterialButton(buttonName: 'Add Data', onPressed: () {
            Navigator.pushNamed(context, AddProductView.routeName);
          }),
        ),
      ],
    );
  }
}