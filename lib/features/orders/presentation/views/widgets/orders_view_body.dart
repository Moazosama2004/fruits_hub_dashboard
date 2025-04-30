import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/helper/get_dummy_order_data.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/views/widgets/filter_section.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/views/widgets/order_item.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/views/widgets/orders_items_list_view.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key, required this.orders});
  final List<OrderEntity> orders;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          FilterSection(),
          SizedBox(height: 16),
          Expanded(child: OrdersItemsListView(orders: orders)),
        ],
      ),
    );
  }
}
