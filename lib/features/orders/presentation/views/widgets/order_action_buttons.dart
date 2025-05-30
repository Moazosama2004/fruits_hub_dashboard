import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/manager/update_order_cubit/update_order_cubit.dart';

import '../../../../../core/enums/order_enum.dart';

class OrderActionButtons extends StatelessWidget {
  const OrderActionButtons({super.key, required this.orderEntity});

  final OrderEntity orderEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Visibility(
          visible: orderEntity.status == OrderStatusEnum.pending,
          child: ElevatedButton(
            onPressed: () {
              context.read<UpdateOrderCubit>().updateOrder(
                status: OrderStatusEnum.accepted,
                orderId: orderEntity.orderId,
              );
            },
            child: const Text('Accept'),
          ),
        ),
        Visibility(
          visible: orderEntity.status == OrderStatusEnum.pending,
          child: ElevatedButton(onPressed: () {}, child: const Text('Reject')),
        ),
        Visibility(
          visible: orderEntity.status == OrderStatusEnum.accepted,
          child: ElevatedButton(
            onPressed: () {
              context.read<UpdateOrderCubit>().updateOrder(
                status: OrderStatusEnum.delivered,
                orderId: orderEntity.orderId,
              );
            },
            child: const Text('Delivered'),
          ),
        ),
      ],
    );
  }
}
