import 'package:fruits_hub_dashboard/features/orders/domain/entities/shipping_address_entity.dart';

class ShippingAddressModel {
  String? phone;
  String? name;
  String? address;
  String? city;
  String? floor;
  String? email;

  ShippingAddressModel({
    this.phone,
    this.name,
    this.address,
    this.city,
    this.floor,
    this.email,
  });

  Map<String, dynamic> toJson() {
    return {
      'phone': phone,
      'name': name,
      'address': address,
      'city': city,
      'floor': floor,
      'email': email,
    };
  }

  factory ShippingAddressModel.fromJson(Map<String, dynamic> json) {
    return ShippingAddressModel(
      phone: json['phone'] as String?,
      name: json['name'] as String?,
      address: json['address'] as String?,
      city: json['city'] as String?,
      floor: json['floor'] as String?,
      email: json['email'] as String?,
    );
  }

  ShippingAddressEntity toEntity() {
    return ShippingAddressEntity(
      phone: phone,
      name: name,
      address: address,
      city: city,
      floor: floor,
      email: email,
    );
  }
}
