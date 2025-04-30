import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/helper/get_dummy_order_data.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/manager/fetch_orders_cubit/fetch_orders_cubit.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/views/widgets/filter_section.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/views/widgets/order_item.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/views/widgets/orders_items_list_view.dart';

class OrdersViewBody extends StatefulWidget {
  const OrdersViewBody({super.key, required this.orders});
  final List<OrderEntity> orders;

  @override
  State<OrdersViewBody> createState() => _OrdersViewBodyState();
}

class _OrdersViewBodyState extends State<OrdersViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<FetchOrdersCubit>().fetchOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          FilterSection(),
          SizedBox(height: 16),
          Expanded(child: OrdersItemsListView(orders: widget.orders)),
        ],
      ),
    );
  }
}
