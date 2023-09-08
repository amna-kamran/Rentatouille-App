// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:rentatouille/screens/home/widgets/uploaded%20properties/property_page.dart';
import 'package:rentatouille/services/auth/auth_provider.dart';
import 'package:rentatouille/services/property/property_provider.dart';

import '../constants/url.dart';
import '../model/property.dart';

class PropertyTile extends StatelessWidget {
  final Property property;
  final String id;

  const PropertyTile({
    Key? key,
    required this.property,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Provider.of<PropertyProvider>(context, listen: false).selectId(id);

        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => PropertyPageScreen(
              property: property,
            ),
          ),
        );
      },
      child: Card(
        elevation: 4.0,
        margin: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 120.0,
              height: 120.0,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(URL.missingImg),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // User Name
                    Text(
                      AuthProvider.getCurrentUserEmail().toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      property.title,
                      style: const TextStyle(fontSize: 16.0),
                    ),
                    Text(
                      "Address: ${property.address}",
                      style: const TextStyle(fontSize: 16.0),
                    ),
                    const SizedBox(height: 8.0),
                    // Price in PKR
                    Text(
                      "PKR: ${property.monthlyRent}",
                      style: const TextStyle(
                        fontSize: 18.0,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
