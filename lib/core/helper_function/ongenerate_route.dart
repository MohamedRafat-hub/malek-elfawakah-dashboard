import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/add_product_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings)
{
  switch(settings.name)
      {
    case AddProductView.routeName:
      return MaterialPageRoute(builder: (context) => AddProductView());
      default:
      return MaterialPageRoute(builder: (context) => Scaffold());
  }
}