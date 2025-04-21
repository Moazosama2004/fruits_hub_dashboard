import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/features/add_product/presentation/views/widgets/add_product_view_body.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  static const routeName = 'addProductView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Product'), centerTitle: true),
      body: AddProductViewBody(),
    );
  }
}
