import 'package:bloc/bloc.dart';
import 'package:fruits_hub_dashboard/core/enums/order_enum.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/repos/orders_repo.dart';
import 'package:meta/meta.dart';

part 'update_order_state.dart';

class UpdateOrderCubit extends Cubit<UpdateOrderState> {
  UpdateOrderCubit(this.ordersRepo) : super(UpdateOrderInitial());
  final OrdersRepo ordersRepo;

  updateOrder({
    required OrderStatusEnum status,
    required String orderId,
  }) async {
    emit(UpdateOrderLoading());
    var result = await ordersRepo.updateOrder(status: status, orderId: orderId);
    result.fold(
      (f) => emit(UpdateOrderFailure(f.errMessage)),
      (v) => emit(UpdateOrderSuccess()),
    );
  }
}
