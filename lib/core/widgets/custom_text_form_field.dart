import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/utils/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.text,
    this.onSaved,
    this.keyboardType,
    this.maxLines = 1,
  });
  final String text;
  final Function(String?)? onSaved;
  final TextInputType? keyboardType;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      onSaved: onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'هذا الحقل مطلوب';
        } else {
          return null;
        }
      },
      keyboardType: keyboardType,
      decoration: InputDecoration(
        fillColor: const Color(0xffF9FAFA),
        filled: true,
        hintText: text,
        hintStyle: AppTextStyles.bold13.copyWith(
          color: const Color(0xff949D9E),
        ),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(color: Color(0xffE6E9EA)),
    );
  }
}
