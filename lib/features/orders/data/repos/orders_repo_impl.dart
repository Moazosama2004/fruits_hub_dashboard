import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/enums/order_enum.dart';
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
  Stream<Either<Failure, List<OrderEntity>>> fetchOrders() async* {
    try {
      await for (var data in databaseService.streamData(
        path: BackendEndPoint.getOrdersData,
      )) {
        List<OrderEntity> orders =
            (data as List<dynamic>)
                .map<OrderEntity>((e) => OrderModel.fromJson(e).toEntity())
                .toList();
        yield right(orders);
      }
    } catch (e) {
      log(e.toString());
      yield left(
        ServerFailure(errMessage: 'Failed to Fetch Data ${e.toString()}'),
      );
    }
  }

  @override
  Future<Either<Failure, void>> updateOrder({
    required OrderStatusEnum status,
    required String orderId,
  }) async {
    try {
      await databaseService.updateData(
        path: BackendEndPoint.updateOrdersData,
        data: {'status': status.name},
        documentId: orderId,
      );
      return right(null);
    } catch (e) {
      return left(ServerFailure(errMessage: 'Failed to Update data.'));
    }
  }
}
