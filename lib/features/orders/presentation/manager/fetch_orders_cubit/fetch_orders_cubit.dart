import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/repos/orders_repo.dart';
import 'package:meta/meta.dart';

part 'fetch_orders_state.dart';

class FetchOrdersCubit extends Cubit<FetchOrdersState> {
  FetchOrdersCubit(this.ordersRepo) : super(FetchOrdersInitial());

  final OrdersRepo ordersRepo;
  StreamSubscription? _streamSubscription;

  void fetchOrders() {
    emit(FetchOrdersLoading());
    _streamSubscription = ordersRepo.fetchOrders().listen((result) {
      result.fold(
        (f) => emit(FetchOrdersFailure(f.errMessage)),
        (orders) => emit(FetchOrdersSuccess(orders: orders)),
      );
    });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
