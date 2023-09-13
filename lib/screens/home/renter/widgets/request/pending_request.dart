import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rentatouille/constants/spaces.dart';
import 'package:rentatouille/model/property.dart';
import 'package:rentatouille/services/property/property_provider.dart';

import 'request_tile.dart';

class PendingRequestScreen extends StatefulWidget {
  const PendingRequestScreen({Key? key}) : super(key: key);

  @override
  State<PendingRequestScreen> createState() => _PendingRequestScreenState();
}

class _PendingRequestScreenState extends State<PendingRequestScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<PropertyProvider>(context, listen: false).fetchRequests();
  }

  @override
  Widget build(BuildContext context) {
    final propertyProvider = Provider.of<PropertyProvider>(context);
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: propertyProvider.fetchRequests(),
      builder: (BuildContext context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          debugPrint(snapshot.data.toString());
          return Center(
            child: Text('Error loading requests: ${snapshot.error}'),
          );
        } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(
            child: Text('No requests available'),
          );
        } else {
          final requests = snapshot.data!.docs;

          return ListView.builder(
            itemCount: requests.length,
            itemBuilder: (BuildContext context, int index) {
              final requestData = requests[index].data();
              final propertyId = requestData['id'];

              return Column(
                children: [
                  FutureBuilder<Property?>(
                    future: propertyProvider.getPropertyById(propertyId),
                    builder: (BuildContext context,
                        AsyncSnapshot<Property?> propertySnapshot) {
                      if (propertySnapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (propertySnapshot.hasError) {
                        return Text(
                            'Error loading property: ${propertySnapshot.error}');
                      } else if (!propertySnapshot.hasData ||
                          propertySnapshot.data == null) {
                        return const Text('Property not found');
                      } else {
                        final property = propertySnapshot.data!;
                        debugPrint("here");
                        return RequestTile(
                          property: property,
                        );
                      }
                    },
                  ),
                  Spaces.dividedNoSpace,
                ],
              );
            },
          );
        }
      },
    );
  }
}
