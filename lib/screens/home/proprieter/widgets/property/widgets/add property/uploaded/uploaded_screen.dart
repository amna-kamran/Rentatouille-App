import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rentatouille/core/property_tile.dart';
import 'package:rentatouille/model/property.dart';
import 'package:rentatouille/services/property/property_provider.dart';

class UploadedScreen extends StatelessWidget {
  const UploadedScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Property>>(
      stream: Provider.of<PropertyProvider>(context).fetchProperties(),
      builder: (BuildContext context, AsyncSnapshot<List<Property>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          debugPrint(snapshot.data.toString());
          return Center(
            child: Text('Error loading properties: ${snapshot.error}'),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text('No properties available'),
          );
        } else {
          final properties = snapshot.data!;

          return ListView.builder(
            itemCount: properties.length,
            itemBuilder: (BuildContext context, int index) {
              final property = properties[index];
              debugPrint(property.address);

              return PropertyTile(
                property: property,
              );
            },
          );
        }
      },
    );
  }
}
