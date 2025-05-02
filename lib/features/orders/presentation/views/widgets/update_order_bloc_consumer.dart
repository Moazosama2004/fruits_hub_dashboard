import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/helper/build_error_snack_bar.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/manager/update_order_cubit/update_order_cubit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UpdateOrderBlocConsumer extends StatelessWidget {
  const UpdateOrderBlocConsumer({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateOrderCubit, UpdateOrderState>(
      listener: (context, state) {
        if (state is UpdateOrderSuccess) {
          showErrorBar(context, message: 'order updated done');
        } else if (state is UpdateOrderFailure) {
          showErrorBar(context, message: state.errMessage);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is UpdateOrderLoading,
          child: child,
        );
      },
    );
  }
}
