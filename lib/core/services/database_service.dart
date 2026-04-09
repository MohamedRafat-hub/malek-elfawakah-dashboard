abstract class DatabaseService {
  Future<void> addData(
    String collectionName,
    Map<String, dynamic> data,
    String? uid,
  );
  Future<Map<String , dynamic>>getData(String collectionName, String id);
}
