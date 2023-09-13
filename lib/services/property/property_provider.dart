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

  Stream<QuerySnapshot<Map<String, dynamic>>> fetchRequests() {
    return FirebaseFirestore.instance
        .collection('requests')
        .where('renter_id', isEqualTo: AuthProvider.getCurrentUserId())
        .snapshots();
  }

  static Future<void> storeRequest(Map<String, dynamic> requestData) async {
    try {
      final CollectionReference collection = _firestore.collection('requests');
      final QuerySnapshot<Map<String, dynamic>> existingIds = (await collection
          .where('id', isEqualTo: requestData['id'])
          .get()) as QuerySnapshot<Map<String, dynamic>>;
      if (existingIds.docs.isNotEmpty) {
        throw Exception("Property ID already requested");
      }
      int timestamp = DateTime.now().microsecondsSinceEpoch;
      debugPrint(timestamp.toString());

      await collection.doc(timestamp.toString()).set(requestData);
    } catch (e) {
      debugPrint(e.toString());
      throw ("Some error occurred");
    }
  }

  Future<Property?> getPropertyById(String id) async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> propertySnapshot =
          await FirebaseFirestore.instance
              .collection('properties')
              .doc(id)
              .get();

      if (propertySnapshot.exists) {
        final propertyData = propertySnapshot.data();
        if (propertyData != null) {
          return Property.fromMap(propertyData);
        }
      }

      return null;
    } catch (e) {
      debugPrint(e.toString());
      throw ("Error fetching property by ID");
    }
  }

  String? get selectedId => _selectedId;

  void selectId(String? id) {
    _selectedId = id;
    notifyListeners();
  }
}
