import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rentatouille/core/property_tile.dart';
import 'package:rentatouille/model/property.dart';
import 'package:rentatouille/services/property/property_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UploadedScreen extends StatelessWidget {
  const UploadedScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: Provider.of<PropertyProvider>(context).fetchProperties(),
      builder: (BuildContext context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          debugPrint(snapshot.data.toString());
          return Center(
            child: Text('Error loading properties: ${snapshot.error}'),
          );
        } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(
            child: Text('No properties available'),
          );
        } else {
          final properties = snapshot.data!.docs;

          return ListView.builder(
            itemCount: properties.length,
            itemBuilder: (BuildContext context, int index) {
              final documentId = properties[index].id;
              final propertyData = properties[index].data();

              final property = Property.fromMap(propertyData);

              return PropertyTile(
                property: property,
                id: documentId,
              );
            },
          );
        }
      },
    );
  }
}
