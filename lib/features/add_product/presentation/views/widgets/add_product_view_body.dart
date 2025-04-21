import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/helper/build_error_snack_bar.dart';
import 'package:fruits_hub_dashboard/core/utils/app_text_styles.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_button.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_check_box.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:fruits_hub_dashboard/core/widgets/image_field.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/widgets/is_featured_box.dart';
import 'package:image_picker/image_picker.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String name, description, code;
  late num price;
  XFile? imageFile;
  bool isFeatured = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: formkey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              CustomTextFormField(
                text: 'Product Name',
                onSaved: (data) {
                  name = data!;
                },
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                text: 'Product Price',
                onSaved: (data) {
                  price = num.parse(data!);
                },
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                text: 'Product Code',
                onSaved: (data) {
                  code = data!.toLowerCase();
                },
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                text: 'Product Description',
                onSaved: (data) {
                  description = data!;
                },
                maxLines: 5,
              ),
              SizedBox(height: 16),
              IsFeaturedCheckBox(),
              SizedBox(height: 16),
              ImageField(
                onFileChanged: (image) {
                  imageFile = image;
                },
              ),
              SizedBox(height: 16),
              CustomButton(
                text: 'Add Product',
                onPressed: () {
                  if (imageFile != null) {
                    if (formkey.currentState!.validate()) {
                      formkey.currentState!.save();
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  } else {
                    showErrorBar(context, message: 'Please Select an image');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
