import 'package:image_picker/image_picker.dart';

abstract class StorageService {
  Future<String> uploadFile({required String imageBase64});
}
