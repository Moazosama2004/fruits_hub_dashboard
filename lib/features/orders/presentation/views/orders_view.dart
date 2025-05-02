import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/services/get_it_service.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/repos/orders_repo.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/manager/fetch_orders_cubit/fetch_orders_cubit.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/manager/update_order_cubit/update_order_cubit.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/views/widgets/orders_view_body.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/views/widgets/orders_view_body_bloc_builder.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/views/widgets/update_order_bloc_consumer.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});
  static const String routeName = 'ordersView';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FetchOrdersCubit(getIt.get<OrdersRepo>()),
        ),
        BlocProvider(
          create: (context) => UpdateOrderCubit(getIt.get<OrdersRepo>()),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(title: Text('Orders'), centerTitle: true),
        body: UpdateOrderBlocConsumer(child: OrdersViewBodyBlocBuilder()),
      ),
    );
  }
}
