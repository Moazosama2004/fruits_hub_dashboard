import 'order_product_entity.dart';
import 'shipping_address_entity.dart';

class OrderEntity {
  final double totalPrice;
  final String uId;
  // final String orderID;
  final ShippingAddressEntity shippingAddress;
  final List<OrderProductEntity> orderProducts;
  final String paymentMethod;
  // final OrderStatusEnum status;
  OrderEntity({
    required this.totalPrice,
    required this.uId,
    // required this.orderID,
    // required this.status,
    required this.shippingAddress,
    required this.orderProducts,
    required this.paymentMethod,
  });
}

// payment method
