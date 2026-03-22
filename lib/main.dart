import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/helper_function/ongenerate_route.dart';
import 'package:fruits_hub_dashboard/features/dashboard/views/dashboard_view.dart';

void main(){
  runApp(FruitsHubDashBoard());
}

class FruitsHubDashBoard extends StatelessWidget {
  const FruitsHubDashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      home: DashboardView(),
    );
  }
}


