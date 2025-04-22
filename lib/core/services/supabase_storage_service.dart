import 'dart:io';
import 'package:fruits_hub_dashboard/core/services/storage_service.dart';
import 'package:fruits_hub_dashboard/core/utils/backend_end_point.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as b;

class SupabaseStorageService implements StorageService {
  static late Supabase _supabase;

  // recommended create it in dashboard
  static createBucket({required String bucketName}) async {
    var buckets = await _supabase.client.storage.listBuckets();
    bool isBucketExists = false;

    for (var bucket in buckets) {
      if (bucket.id == bucketName) {
        isBucketExists = true;
        break;
      }
    }
    if (!isBucketExists) {
      await _supabase.client.storage.createBucket(bucketName);
    }
  }

  static initSupaBase() async {
    _supabase = await Supabase.initialize(
      url: 'https://iaqnihkawgxduomwtraj.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlhcW5paGthd2d4ZHVvbXd0cmFqIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc0NTMwMTY2OSwiZXhwIjoyMDYwODc3NjY5fQ.mTx7BknLn9TQMjVoIFJMKFPVC9vQCYej1ve23ZgXy_E',
    );
  }

  @override
  Future<String> uploadFile({required XFile file, required String path}) async {
    final uploadfile = File(file.path);
    String fileName = b.basename(file.path);
    String extensionName = b.extension(file.path);
    await _supabase.client.storage
        .from('fruits_images')
        .upload('$path/$fileName.$extensionName', uploadfile);
    final String imageUrl = _supabase.client.storage
        .from('fruits_images')
        .getPublicUrl('$path/$fileName.$extensionName');
    return imageUrl;
  }
}
