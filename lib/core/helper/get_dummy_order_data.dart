import '../../features/orders/data/models/order_model.dart';
import '../../features/orders/data/models/order_product_model.dart';
import '../../features/orders/data/models/shipping_address_model.dart';

OrderModel getDummyOrder() {
  // Create a sample shipping address model
  ShippingAddressModel shippingAddress = ShippingAddressModel(
    name: 'John Doe',
    phone: '123-456-7890',
    address: '123 Main St',
    floor: '5th Floor',
    city: 'New York',
    email: 'johndoe@example.com',
  );

  // Create a sample list of order product models
  List<OrderProductModel> orderProducts = [
    OrderProductModel(
      name: 'Product A',
      code: 'A123',
      imageUrl:
          'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?cs=srgb&dl=pexels-anjana-c-169994-674010.jpg&fm=jpg',
      price: 49.99,
      quantity: 2,
    ),
    OrderProductModel(
      name: 'Product B',
      code: 'B456',
      imageUrl:
          'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?cs=srgb&dl=pexels-anjana-c-169994-674010.jpg&fm=jpg',
      price: 29.99,
      quantity: 1,
    ),
    OrderProductModel(
      name: 'Product C',
      code: 'C789',
      imageUrl:
          'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?cs=srgb&dl=pexels-anjana-c-169994-674010.jpg&fm=jpg',
      price: 19.99,
      quantity: 3,
    ),
  ];

  // Calculate total price
  double totalPrice = orderProducts.fold(
    0,
    (sum, product) => sum + (product.price * product.quantity),
  );

  // Create and return the OrderModel
  return OrderModel(
    uId: 'user123',
    totalPrice: totalPrice,
    paymentMethod: 'Cash',
    shippingAddressModel: shippingAddress,
    orderProducts: orderProducts,
  );
}
