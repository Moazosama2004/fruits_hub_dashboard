import 'package:fruits_hub_dashboard/core/enums/order_enum.dart';

import 'order_product_entity.dart';
import 'shipping_address_entity.dart';

class OrderEntity {
  final double totalPrice;
  final String uId;
  final String orderId;
  final ShippingAddressEntity shippingAddress;
  final List<OrderProductEntity> orderProducts;
  final String paymentMethod;
  final OrderStatusEnum status;

  OrderEntity({
    required this.totalPrice,
    required this.uId,
    required this.orderId,
    required this.status,
    required this.shippingAddress,
    required this.orderProducts,
    required this.paymentMethod,
  });
}
