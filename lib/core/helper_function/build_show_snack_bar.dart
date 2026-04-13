import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> buildShowSnackBar(
    BuildContext context,
    String message,
    ) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: AppColors.primaryColor,
      content: Center(
        child: Text(
          message,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    ),
  );
}