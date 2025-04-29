import 'package:fruits_hub_dashboard/features/orders/data/models/order_product_model.dart';
import 'package:fruits_hub_dashboard/features/orders/data/models/shipping_address_model.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_entity.dart';

class OrderModel {
  final String uId;
  final double totalPrice;
  final String paymentMethod;
  final ShippingAddressModel shippingAddressModel;
  final List<OrderProductModel> orderProducts;

  OrderModel({
    required this.uId,
    required this.totalPrice,
    required this.paymentMethod,
    required this.shippingAddressModel,
    required this.orderProducts,
  });

  Map<String, dynamic> toJson() {
    return {
      'uId': uId,
      'totalPrice': totalPrice,
      'paymentMethod': paymentMethod,
      'shippingAddress': shippingAddressModel.toJson(),
      'status': 'Pending',
      'date': DateTime.now().toString(),
      'orderProducts':
          orderProducts.map((product) => product.toJson()).toList(),
    };
  }

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      uId: json['uId'] as String,
      totalPrice: (json['totalPrice'] as num).toDouble(),
      paymentMethod: json['paymentMethod'] as String,
      shippingAddressModel: ShippingAddressModel.fromJson(
        json['shippingAddress'],
      ),
      orderProducts:
          (json['orderProducts'] as List<dynamic>)
              .map((productJson) => OrderProductModel.fromJson(productJson))
              .toList(),
    );
  }
}
