import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({super.key, required this.isFeatured});
  final ValueChanged<bool> isFeatured;
  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isChecked,
      onChanged: (value) {
        setState(() {
          isChecked = value;
          widget.isFeatured(value!);
        });
      },
      activeColor: AppColors.primaryColor,
    );
  }
}