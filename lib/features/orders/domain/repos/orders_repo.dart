import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failure.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_entity.dart';

abstract class OrdersRepo {
  Stream<Either<Failure, List<OrderEntity>>> fetchOrders();
}
