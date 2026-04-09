import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits_hub_dashboard/core/services/database_service.dart';
class FireStoreService implements DatabaseService {
  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  @override
  Future<void> addData(
    String collectionName,
    Map<String, dynamic> data,
    String? uid,
  ) async {
    if (uid != null) {
      await fireStore.collection(collectionName).doc(uid).set(data);
    } else {
      await fireStore.collection(collectionName).add(data);
    }
  }

  @override
  Future<Map<String, dynamic>> getData(String collectionName, id) async {
    var data = await fireStore.collection(collectionName).doc(id).get();
    return data.data() as Map<String, dynamic>;
  }
}
