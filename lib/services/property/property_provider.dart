import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rentatouille/model/property.dart';
import 'package:rentatouille/services/auth/auth_provider.dart';

class PropertyProvider extends ChangeNotifier {
  static final _firestore = FirebaseFirestore.instance;
  List<Property> properties = [];

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

  Stream<List<Property>> fetchProperties() {
    return FirebaseFirestore.instance
        .collection('properties')
        .where('user_id', isEqualTo: AuthProvider.getCurrentUserId())
        .snapshots()
        .map(
      (QuerySnapshot querySnapshot) {
        List<Property> properties = [];

        for (QueryDocumentSnapshot document in querySnapshot.docs) {
          Map<String, dynamic> prop = document.data() as Map<String, dynamic>;

          Property data = Property.fromMap(prop);

          //debugPrint(data.toString());
          //Property property = Property.fromMap(data);

          properties.add(data);
        }

        return properties;
      },
    );
  }
}
