import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_check_box.dart';

class IsFeaturedCheckBox extends StatefulWidget {
  const IsFeaturedCheckBox({super.key});

  @override
  State<IsFeaturedCheckBox> createState() => _IsFeaturedCheckBoxState();
}

class _IsFeaturedCheckBoxState extends State<IsFeaturedCheckBox> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomCheckBox(
          isChecked: isChecked,
          onChecked: (value) {
            isChecked = value;
            setState(() {});
          },
        ),
        Text('is Featured item ?'),
      ],
    );
  }
}
