import 'package:image_picker/image_picker.dart';

class AddProductInputEntity {
  final String name;
  final String code;
  final String description;
  final num price;
  final XFile image;
  final bool isFeatured;
  final String? imageUrl;

  AddProductInputEntity({
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.image,
    required this.isFeatured,
    this.imageUrl,
  });
}
