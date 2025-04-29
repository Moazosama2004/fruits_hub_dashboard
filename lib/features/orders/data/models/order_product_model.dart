class OrderProductModel {
  final String name;
  final String imageUrl;
  final String code;
  final num price;
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
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      code: json['code'] as String,
      price: json['price'] as num,
      quantity: json['quantity'] as int,
    );
  }
}
