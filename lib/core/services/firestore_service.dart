import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits_hub_dashboard/core/services/database_service.dart';

class FirestoreService implements DatabaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  }) async {
    if (documentId != null) {
      await _firestore.collection(path).doc(documentId).set(data);
    } else {
      await _firestore.collection(path).add(data);
    }
  }

  @override
  Future<void> updateData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  }) async {
    if (documentId != null) {
      await _firestore.collection(path).doc(documentId).update(data);
    }
  }

  @override
  Future<bool> checkIfDataExists({
    required String path,
    required String documentId,
  }) async {
    var data = await _firestore.collection(path).doc(documentId).get();
    return data.exists;
  }

  @override
  Future<dynamic> getData({
    required String path,
    String? documentId,
    Map<String, dynamic>? query,
  }) async {
    if (documentId != null) {
      var data = await _firestore.collection(path).doc(documentId).get();
      return data.data();
    } else {
      Query<Map<String, dynamic>> data = _firestore.collection(path);
      if (query != null) {
        if (query['orderBy'] != null) {
          var orderByField = query['orderBy'];
          var descending = query['descending'];
          data = data.orderBy(orderByField, descending: descending);
        }
        if (query['limit'] != null) {
          var limit = query['limit'];
          data = data.limit(limit);
        }
      }
      var result = await data.get();
      return result.docs.map((e) => e.data()).toList();
    }
  }

  @override
  Stream streamData({
    required String path,
    String? documentId,
    Map<String, dynamic>? query,
  }) async* {
    Query<Map<String, dynamic>> data = _firestore.collection(path);
    if (query != null) {
      if (query['orderBy'] != null) {
        var orderByField = query['orderBy'];
        var descending = query['descending'];
        data = data.orderBy(orderByField, descending: descending);
      }
      if (query['limit'] != null) {
        var limit = query['limit'];
        data = data.limit(limit);
      }
    }
    await for (var snapshot in data.snapshots()) {
      yield snapshot.docs.map((e) => e.data()).toList();
    }
  }
}
