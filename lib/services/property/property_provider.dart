import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rentatouille/model/property.dart';
import 'package:rentatouille/services/auth/auth_provider.dart';

class PropertyProvider extends ChangeNotifier {
  static final _firestore = FirebaseFirestore.instance;
  List<Property> properties = [];
  String? _selectedId;

  static Future<void> create(Map<String, dynamic> propertyData) async {
    try {
      final CollectionReference collection =
          _firestore.collection('properties');

      int timestamp = DateTime.now().microsecondsSinceEpoch;
      debugPrint(timestamp.toString());
      await collection.doc(timestamp.toString()).set(propertyData);
    } catch (e) {
      debugPrint(e.toString());
      throw ("some error occurred");
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> fetchProperties() {
    return FirebaseFirestore.instance
        .collection('properties')
        .where('user_id', isEqualTo: AuthProvider.getCurrentUserId())
        .snapshots();
  }

  static Future<void> storeRequest(String? propertyId) async {
    try {
      final CollectionReference collection = _firestore.collection('requests');

      final QuerySnapshot<Map<String, dynamic>> existingIds = (await collection
          .where('id', isEqualTo: propertyId)
          .get()) as QuerySnapshot<Map<String, dynamic>>;
      debugPrint(propertyId);
      existingIds.docs.forEach((doc) {
        final data = doc.data();
        final id = data['id'];
        print('ID: $id');
      });

      if (existingIds.docs.isNotEmpty) {
        throw Exception("Property ID already requested");
      }

      int timestamp = DateTime.now().microsecondsSinceEpoch;
      debugPrint(timestamp.toString());

      Map<String, dynamic> requestData = {
        'id': propertyId,
      };

      await collection.doc(timestamp.toString()).set(requestData);
    } catch (e) {
      debugPrint(e.toString());
      throw ("Some error occurred");
    }
  }

  String? get selectedId => _selectedId;

  void selectId(String? id) {
    _selectedId = id;
    notifyListeners();
  }
}
