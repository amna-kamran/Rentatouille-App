import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rentatouille/constants/url.dart';
import 'package:rentatouille/core/property_tile.dart';
import 'package:rentatouille/services/auth/auth_provider.dart';
import 'package:rentatouille/services/property/property_provider.dart'; // Import your property provider here

class UploadedScreen extends StatelessWidget {
  const UploadedScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: PropertyProvider.fetchProperties(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          final properties = snapshot.data!.docs.reversed.toList();

          if (properties.isEmpty) {
            return const Center(
              child: Text('No properties available'),
            );
          }

          return ListView.builder(
            itemCount: properties.length,
            itemBuilder: (BuildContext context, int index) {
              final property = properties[index];

              return PropertyTile(
                title: property['title'],
                address: property['address'],
                pricePKR: property['monthly rent'],
                image: URL.missingImg,
                userName: AuthProvider.getCurrentUserEmail().toString(),
              );
            },
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Error loading properties'),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
