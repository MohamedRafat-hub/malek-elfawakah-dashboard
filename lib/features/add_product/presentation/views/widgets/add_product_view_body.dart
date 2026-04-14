import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/utils/app_colors.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_material_button.dart';
import 'package:fruits_hub_dashboard/features/add_product/domain/entities/add_product_entity.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/helper_function/build_show_snack_bar.dart';
import '../../../../../core/widgets/custom_text_field.dart';
import '../../managers/cubits/addProductCubit/add_product_cubit.dart';
import 'custom_checkbox.dart';
import 'custom_image_field.dart';

class AddProductViewBody extends StatelessWidget {
  AddProductViewBody({super.key});

  GlobalKey<FormState> _formKey = GlobalKey();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  late String name, description, code;
  late num price ;
  late int numberOfCalories , unitAmount , expirationMonths;
  bool isFeatured = false;
  bool isOrganic = false;
  File? image;

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: _autovalidateMode,
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            spacing: 10,
            children: [
              CustomTextFormField(
                onSaved: (value) {
                  name = value!;
                },
                hintText: 'Product Name',
                keyboardType: TextInputType.text,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  price = num.parse(value!);
                },
                hintText: 'Product Price',
                keyboardType: TextInputType.number,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  code = value!.toLowerCase();
                },
                hintText: 'Product code',
                keyboardType: TextInputType.text,
              ),CustomTextFormField(

                onSaved: (value) {
                  expirationMonths = int.parse(value!);
                },
                hintText: 'Expiration months',
                keyboardType: TextInputType.number,
              ),CustomTextFormField(
                onSaved: (value) {
                  numberOfCalories = int.parse(value!);
                },
                hintText: 'Number of calories',
                keyboardType: TextInputType.number,
              ),CustomTextFormField(
                onSaved: (value) {
                  unitAmount = int.parse(value!);
                },
                hintText: 'Unit amount',
                keyboardType: TextInputType.number,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  description = value!;
                },
                hintText: 'Product description',
                keyboardType: TextInputType.text,
                maxLine: 5,
              ),
              Row(
                children: [
                  CustomCheckBox(
                    isFeatured: (isCheck) {
                      isFeatured = isCheck;
                    },
                  ),
                  Text(
                    'Is Featured Product',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  CustomCheckBox(
                    isFeatured: (isCheck) {
                      isOrganic = isCheck;
                    },
                  ),
                  Text(
                    'Is Organic Product',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              ImageField(
                onFileChanged: (image) {
                  this.image = image;
                },
              ),
              SizedBox(height: 10),
              BlocConsumer<AddProductCubit, AddProductState>(
                listener: (context, state) {
                  if (state is AddProductFailure) {
                    buildShowSnackBar(context , 'failure to add product ${state.errorMessage}');
                  } else if (state is AddProductSuccess) {
                    buildShowSnackBar(context , 'Product Added Successfully');
                    Navigator.pop(context);
                  }
                },
                builder: (context, state) {
                  bool loading = state is AddProductLoading;
                  return loading
                      ? SizedBox(
                          height: 50,
                          child: Center(
                            child: CupertinoActivityIndicator(
                              color: AppColors.primaryColor,
                              radius: 20,
                            ),
                          ),
                        )
                      : CustomMaterialButton(
                          buttonName: 'Add Product',
                          onPressed: () async {
                            if (image != null) {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                AddProductEntity entity = AddProductEntity(
                                  name: name,
                                  price: price,
                                  code: code,
                                  description: description,
                                  isFeatured: isFeatured,
                                  image: image!,
                                  expirationMonths: expirationMonths,
                                  numberOfCalories: numberOfCalories,
                                  unitAmount: unitAmount,
                                  isOrganic: isOrganic,
                                );
                                context.read<AddProductCubit>().addProduct(
                                  entity,
                                );
                              } else {
                                _autovalidateMode = AutovalidateMode.always;
                              }
                            } else {
                              buildShowSnackBar(context, 'Please select an image for the product');
                            }
                          },
                        );
                },
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
