import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_check_box.dart';

class IsOrganicItemBox extends StatefulWidget {
  const IsOrganicItemBox({super.key, required this.onChanged});
  final ValueChanged<bool> onChanged;

  @override
  State<IsOrganicItemBox> createState() => _IsFeaturedCheckBoxState();
}

class _IsFeaturedCheckBoxState extends State<IsOrganicItemBox> {
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
            widget.onChanged(value);
            setState(() {});
          },
        ),
        Text('is Organic item ?'),
      ],
    );
  }
}
