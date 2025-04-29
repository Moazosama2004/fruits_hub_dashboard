// import 'package:fruits_hub_dashboard/features/orders/domain/entities/shipping_address_entity.dart';

// class OrderEntity {
//   final String uId;
//   final CartEntity cartEntity;
//   bool? payWithCash;
//   ShippingAddressEntity shippingAddressEntity;

//   OrderEntity({
//     required this.cartEntity,
//     this.payWithCash,
//     required this.shippingAddressEntity,
//     required this.uId,
//   });

//   num calculateShippingCost() {
//     return 30;
//   }

//   num calculateShippingDiscount() {
//     return 0;
//   }

//   num calculateTotalPriceAfterDiscountAndShipping() {
//     return cartEntity.calculateTotalPrice() +
//         calculateShippingCost() -
//         calculateShippingDiscount();
//   }

//   @override
//   String toString() {
//     return 'OrderEntity(uId: $uId, cartEntity: $cartEntity, payWithCash: $payWithCash, shippingAddressEntity: $shippingAddressEntity)';
//   }
// }
