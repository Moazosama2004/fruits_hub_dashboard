import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_product_entity.dart';

class OrderProductModel {
  final String name;
  final String imageUrl;
  final String code;
  final double price;
  final int quantity;

  OrderProductModel({
    required this.name,
    required this.imageUrl,
    required this.code,
    required this.price,
    required this.quantity,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'imageUrl': imageUrl,
      'code': code,
      'price': price,
      'quantity': quantity,
    };
  }

  factory OrderProductModel.fromJson(Map<String, dynamic> json) {
    return OrderProductModel(
      name: json['name'],
      code: json['code'],
      imageUrl: json['imageUrl'],
      price: (json['price'] as num).toDouble(),
      quantity: json['quantity'],
    );
  }

  OrderProductEntity toEntity() {
    return OrderProductEntity(
      name: name,
      imageUrl: imageUrl,
      code: code,
      price: price,
      quantity: quantity,
    );
  }
}
