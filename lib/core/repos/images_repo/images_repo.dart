import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failure.dart';
import 'package:image_picker/image_picker.dart';

abstract class ImagesRepo {
  Future<Either<Failure, String>> uploadImage({required XFile image});
}
