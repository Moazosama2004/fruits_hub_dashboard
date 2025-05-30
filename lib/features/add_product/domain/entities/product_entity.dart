import 'package:fruits_hub_dashboard/features/add_product/domain/entities/review_entity.dart';
import 'package:image_picker/image_picker.dart';

class ProductEntity {
  final String name;
  final String code;
  final String description;
  final num price;
  final XFile image;
  final bool isFeatured;
  String? imageUrl;
  final int expirationsMonths;
  bool isOrganic;
  final int numberOfCalories;
  final int unitAmount;
  final num avgRating = 0;
  final num ratingCount = 0;
  final List<ReviewEntity> reviews;

  ProductEntity({
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.image,
    required this.isFeatured,
    required this.expirationsMonths,
    this.isOrganic = false,
    required this.numberOfCalories,
    required this.unitAmount,
    this.imageUrl,
    required this.reviews,
  });
}
