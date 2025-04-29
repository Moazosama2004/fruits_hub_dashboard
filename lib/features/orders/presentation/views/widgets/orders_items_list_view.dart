import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/helper/get_dummy_order_data.dart';
import 'package:fruits_hub_dashboard/features/orders/data/models/order_model.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/views/widgets/order_item.dart';

class OrdersItemsListView extends StatelessWidget {
  const OrdersItemsListView({super.key, required this.orders});

  final List<OrderModel> orders;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: orders.length,
      itemBuilder: (context, index) => OrderItem(orderModel: orders[index]),
    );
  }
}
