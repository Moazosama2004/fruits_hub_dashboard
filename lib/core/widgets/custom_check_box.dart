import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/utils/app_colors.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    super.key,
    required this.isChecked,
    required this.onChecked,
  });
  final bool isChecked;
  final ValueChanged<bool> onChecked;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChecked(!isChecked);
      },
      child: AnimatedContainer(
        duration: const Duration(microseconds: 100),
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: isChecked ? AppColors.primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isChecked ? Colors.transparent : const Color(0xffDDDFDF),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Center(
            child: Icon(Icons.check, color: Colors.white, size: 18),
          ),
        ),
      ),
    );
  }
}
