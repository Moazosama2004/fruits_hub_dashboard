import 'package:fruits_hub_dashboard/core/enums/order_enum.dart';
import 'package:fruits_hub_dashboard/features/orders/data/models/order_product_model.dart';
import 'package:fruits_hub_dashboard/features/orders/data/models/shipping_address_model.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_entity.dart';

class OrderModel {
  final String uId;
  final double totalPrice;
  final String paymentMethod;
  final ShippingAddressModel shippingAddressModel;
  final List<OrderProductModel> orderProducts;
  final String status;
  final String orderId;

  OrderModel({
    required this.uId,
    required this.orderId,
    required this.totalPrice,
    required this.paymentMethod,
    required this.shippingAddressModel,
    required this.orderProducts,
    required this.status,
  });

  Map<String, dynamic> toJson() {
    return {
      'uId': uId,
      'orderId': orderId,
      'totalPrice': totalPrice,
      'paymentMethod': paymentMethod,
      'shippingAddress': shippingAddressModel.toJson(),
      'status': 'Pending',
      'date': DateTime.now().toString(),
      'orderProducts':
          orderProducts.map((product) => product.toJson()).toList(),
    };
  }

  OrderEntity toEntity() {
    return OrderEntity(
      status: fetchEnum(),
      uId: uId,
      totalPrice: totalPrice,
      paymentMethod: paymentMethod,
      shippingAddress: shippingAddressModel.toEntity(),
      orderProducts:
          orderProducts.map((product) => product.toEntity()).toList(),
      orderID: orderId,
    );
  }

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
    totalPrice: (json['totalPrice'] as num).toDouble(),
    uId: json['uId'],
    status: json['status'],
    orderId: json['orderId'],
    shippingAddressModel: ShippingAddressModel.fromJson(
      json['shippingAddress'],
    ),
    orderProducts: List<OrderProductModel>.from(
      json['orderProducts'].map((e) => OrderProductModel.fromJson(e)),
    ),
    paymentMethod: json['paymentMethod'],
  );

  OrderStatusEnum fetchEnum() {
    return OrderStatusEnum.values.firstWhere((e) {
      var enumStatus = e.name.toString();
      return enumStatus == (status ?? 'pending');
    });
  }
}
