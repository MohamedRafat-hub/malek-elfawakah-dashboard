abstract class DatabaseService {
  Future<void> addData({
    required String collectionName,
    required Map<String, dynamic> data,
    String? uid,
  });
  Future<Map<String, dynamic>> getData(String collectionName, String id);
}
