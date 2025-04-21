import 'package:cross_file/src/types/interface.dart';
import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failure.dart';
import 'package:fruits_hub_dashboard/core/repos/images_repo/images_repo.dart';

class ImagesRepoImpl implements ImagesRepo {
  @override
  Future<Either<Failure, String>> uploadImage({required XFile image}) {
    // TODO: implement uploadImage
    throw UnimplementedError();
  }
}
