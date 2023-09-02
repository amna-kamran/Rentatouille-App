import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PropertyProvider {
  static final _firestore = FirebaseFirestore.instance;

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
}
