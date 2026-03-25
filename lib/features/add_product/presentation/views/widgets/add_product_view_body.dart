import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_material_button.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/widgets/custom_text_field.dart';
import 'custom_checkbox.dart';
import 'custom_image_field.dart';

class AddProductViewBody extends StatelessWidget {
  AddProductViewBody({super.key});

  GlobalKey<FormState> _formKey = GlobalKey();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  late String name , description , code;
  late num price;
  bool isFeatured = false;
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
                onSaved: (value){
                  name = value!;
                },
                hintText: 'Product Name',
                keyboardType: TextInputType.text,
              ),
              CustomTextFormField(
                onSaved: (value){
                  price = num.parse(value!);
                },
                hintText: 'Product Price',
                keyboardType: TextInputType.number,
              ),
              CustomTextFormField(
                onSaved: (value){
                  code = value!.toLowerCase();
                },
                hintText: 'Product code',
                keyboardType: TextInputType.text,
              ),
              CustomTextFormField(
                onSaved: (value){
                  description = value!;
                },
                hintText: 'Product description',
                keyboardType: TextInputType.text,
                maxLine: 5,
              ),
              Row(
                children: [
                  CustomCheckBox(
                    isFeatured: (isCheck){
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
              ImageField(onFileChanged: (image) {
                this.image = image;
              }),
              SizedBox(height: 10),
              CustomMaterialButton(
                buttonName: 'Add Product',
                onPressed: (){
                  if(image != null)
                    {
                      if(_formKey.currentState!.validate())
                        {
                          _formKey.currentState!.save();
                          log(name);
                          log(price.toString());
                          log(code);
                          log(description);
                          log(isFeatured.toString());
                        }
                      else
                        {
                          _autovalidateMode = AutovalidateMode.always;
                        }
                    }
                  else
                    {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red,
                          content: Center(child: Text('Please Select Image' , style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),)),
                        ),
                      );
                    }
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




