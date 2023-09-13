import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rentatouille/services/auth/auth_provider.dart';
import 'package:rentatouille/services/property/property_provider.dart';

class RentPropertyButton extends StatelessWidget {
  const RentPropertyButton({super.key});
  @override
  Widget build(BuildContext context) {
    final propertyId = Provider.of<PropertyProvider>(context).selectedId;

    return Container(
      color: Colors.green,
      width: double.infinity,
      child: InkWell(
        onTap: () {
          PropertyProvider.storeRequest(
            {
              'id': propertyId,
              'accepted': false,
              'declined': false,
              'pending': true,
              'renter_id': AuthProvider.getCurrentUserId(),
            },
          );
        },
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Text(
              "Rent Property",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
