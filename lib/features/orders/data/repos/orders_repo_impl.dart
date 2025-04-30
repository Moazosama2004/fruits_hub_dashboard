import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failure.dart';
import 'package:fruits_hub_dashboard/core/services/database_service.dart';
import 'package:fruits_hub_dashboard/core/utils/backend_end_point.dart';
import 'package:fruits_hub_dashboard/features/orders/data/models/order_model.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/repos/orders_repo.dart';

class OrdersRepoImpl implements OrdersRepo {
  final DatabaseService databaseService;

  OrdersRepoImpl(this.databaseService);

  @override
  Future<Either<Failure, List<OrderEntity>>> fetchOrders() async {
    try {
      var data = await databaseService.getData(
        path: BackendEndPoint.getOrdersData,
      );
      log(data.toString());
      List<OrderEntity> orders =
          (data as List<dynamic>)
              .map<OrderEntity>((e) => OrderModel.fromJson(e).toEntity())
              .toList();
      log(orders.toString());
      return right(orders);
    } catch (e) {
      log(e.toString());
      return left(
        ServerFailure(errMessage: 'Failed to Fetch Data ${e.toString()}'),
      );
    }
  }
}
