class ShippingAddressEntity {
  String? phone;
  String? name;
  String? address;
  String? city;
  String? floor;
  String? email;

  ShippingAddressEntity({
    this.name,
    this.phone,
    this.address,
    this.city,
    this.floor,
    this.email,
  });

  @override
  String toString() {
    return '$floor $address $city';
  }
}
