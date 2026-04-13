import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:fruits_hub_dashboard/core/services/storage_service.dart';

class CloudinaryService implements StorageService {
  // ⚠️ عدل القيم دي عندك
  static const String cloudName = 'dnkpgqa83';
  static const String uploadPreset = 'products';

  @override
  Future<String> uploadImage(File image, String path) async {
    try {
      final uri = Uri.parse(
        'https://api.cloudinary.com/v1_1/$cloudName/image/upload',
      );

      var request = http.MultipartRequest('POST', uri);

      // مهم جدًا
      request.fields['upload_preset'] = uploadPreset;

      // ممكن تستخدم path كـ folder
      request.fields['folder'] = path;

      request.files.add(
        await http.MultipartFile.fromPath('file', image.path),
      );

      final response = await request.send();

      if (response.statusCode == 200) {
        final responseData = await response.stream.bytesToString();
        final jsonData = json.decode(responseData);

        // 👇 ده اللينك اللي هتخزنه
        return jsonData['secure_url'];
      } else {
        final error = await response.stream.bytesToString();
        throw Exception('Upload failed: $error');
      }
    } catch (e) {
      throw Exception('Cloudinary upload error: $e');
    }
  }
}