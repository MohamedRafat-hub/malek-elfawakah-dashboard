import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.keyboardType,
    this.icon,
    this.onSaved,
    this.obscureText = false,
    this.maxLine = 1,
  });

  final String hintText;
  final TextInputType keyboardType;
  final Widget? icon;
  final void Function(String?)? onSaved;
  final bool obscureText;
  final int maxLine;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLine,
      cursorColor: Colors.grey,
      obscureText: obscureText,
      onSaved: onSaved,
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'هذا الحقل مطلوب';
        }
        return null;
      },
      keyboardType: keyboardType,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.primaryColor,
                width: 2,
              )
          ),
          suffixIcon: icon,
          hintText: hintText,
          hintStyle: TextStyle(
              color: const Color(0xFF949D9E),
              fontSize: 13,
              fontWeight: FontWeight.w700),
          filled: true,
          fillColor: AppColors.primaryColor,
          border: buildBorder(),
          enabledBorder: buildBorder()),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          width: 1,
          color: Color(0xFFE6E9E9),
        ));
  }
}
