import 'dart:developer';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fruits_hub_dashboard/core/services/storage_service.dart';
import 'package:path/path.dart' as p;
class FireStorage implements StorageService {
  final storageRef = FirebaseStorage.instance.ref();

  @override
  Future<String> uploadImage(File image, String path) async {
    final fileName = p.basename(image.path);  // image name + extension mango.png
    log('file name is $fileName');
    final imageRef = storageRef.child('$path/$fileName');

    await imageRef.putFile(image);

    return await imageRef.getDownloadURL();
  }
}