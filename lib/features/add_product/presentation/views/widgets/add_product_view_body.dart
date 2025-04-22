import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/helper/build_error_snack_bar.dart';
import 'package:fruits_hub_dashboard/core/utils/app_text_styles.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_button.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_check_box.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:fruits_hub_dashboard/core/widgets/image_field.dart';
import 'package:fruits_hub_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/manager/add_product_cubit/add_product_cubit.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/widgets/is_featured_box.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/widgets/is_organic_item_box.dart';
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
  late num price, expirationsMonths, numberOfCalories, unitAmount;
  XFile? imageFile;
  bool isFeatured = false;
  bool isOrganic = false;

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
                text: 'Expirations Months',
                onSaved: (data) {
                  expirationsMonths = num.parse(data!);
                },
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                text: 'Number of Calories',
                onSaved: (data) {
                  numberOfCalories = num.parse(data!);
                },
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                text: 'Unit Amount',
                onSaved: (data) {
                  unitAmount = num.parse(data!);
                },
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                text: 'Description',
                onSaved: (data) {
                  description = data!;
                },
                maxLines: 5,
              ),
              SizedBox(height: 16),
              IsOrganicItemBox(
                onChanged: (value) {
                  isOrganic = value;
                },
              ),
              SizedBox(height: 16),
              IsFeaturedCheckBox(
                onChanged: (value) {
                  isFeatured = value;
                },
              ),
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
                      AddProductInputEntity inputEntity = AddProductInputEntity(
                        reviews: [],
                        name: name,
                        code: code,
                        description: description,
                        price: price,
                        image: imageFile!,
                        isFeatured: isFeatured,
                        expirationsMonths: expirationsMonths.toInt(),
                        isOrganic: isOrganic,
                        unitAmount: unitAmount.toInt(),
                        numberOfCalories: numberOfCalories.toInt(),
                      );
                      context.read<AddProductCubit>().addProduct(
                        inputEntity: inputEntity,
                      );
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
