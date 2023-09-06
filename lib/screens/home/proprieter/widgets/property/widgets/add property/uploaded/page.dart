import 'package:flutter/material.dart';
import 'package:rentatouille/constants/spaces.dart';
import 'package:rentatouille/constants/url.dart';
import 'package:rentatouille/core/uploaded/dropdown.dart';
import 'package:rentatouille/model/property.dart';

class PropertyPageScreen extends StatelessWidget {
  final Property property;
  PropertyPageScreen({super.key, required this.property});

  final List<String> labels = [
    "Title",
    "Description",
    "Address",
    "Bedrooms",
    "Area",
    "Lounge",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 300.0,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(URL.missingImg),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Spaces.h10,
              Text(
                "PKR: ${property.monthlyRent}",
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  color: Colors.green,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spaces.divider,
                    ...labels.asMap().entries.map((entry) {
                      final index = entry.key;
                      final label = entry.value;
                      return Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "${label}: ",
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                _getPropertyValue(index),
                                style: const TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          if (index != labels.length - 1)
                            const Divider(
                              height: 4,
                              color: Colors.grey,
                            ),
                        ],
                      );
                    }),
                    Spaces.divider,
                    CustomDropdown(
                      title: "Reviews",
                    ),
                    Spaces.h15,
                    CustomDropdown(
                      title: "Q/A",
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String _getPropertyValue(int index) {
    switch (index) {
      case 0:
        return property.title;
      case 1:
        return property.description;
      case 2:
        return property.address;
      case 3:
        return property.bedrooms.toString();
      case 4:
        return property.area.toString();
      case 5:
        return property.lounge.toString();
      default:
        return "";
    }
  }
}
