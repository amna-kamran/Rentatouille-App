import 'dart:convert';

import 'package:flutter/material.dart';

class Property {
  final String bedrooms;
  final String area;
  final String title;
  final String description;
  final String address;
  final bool lounge;
  final String monthlyRent;
  final String userId;

  // Constructor with named parameters to initialize properties
  Property({
    required this.bedrooms,
    required this.area,
    required this.title,
    required this.description,
    required this.address,
    required this.lounge,
    required this.monthlyRent,
    required this.userId,
  });

  // Copy constructor for creating a new Property with modified properties
  Property copyWith({
    String? bedrooms,
    String? area,
    String? title,
    String? description,
    String? address,
    bool? lounge,
    String? monthlyRent,
    String? userId,
  }) {
    return Property(
      bedrooms: bedrooms ?? this.bedrooms,
      area: area ?? this.area,
      title: title ?? this.title,
      description: description ?? this.description,
      address: address ?? this.address,
      lounge: lounge ?? this.lounge,
      monthlyRent: monthlyRent ?? this.monthlyRent,
      userId: userId ?? this.userId,
    );
  }

  // Convert the Property object to a Map
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'bedrooms': bedrooms,
      'area': area,
      'title': title,
      'description': description,
      'address': address,
      'lounge': lounge,
      'monthlyRent': monthlyRent,
      'user_id': userId,
    };
  }

  // Factory method to create a Property object from a Map
  factory Property.fromMap(Map<String, dynamic> map) {
    try {
      return Property(
        bedrooms: map['bedrooms'] as String? ?? 'Default Bedrooms',
        area: map['area'] as String? ?? 'Default Area',
        title: map['title'] as String? ?? 'Default Title',
        description: map['description'] as String? ?? 'Default Description',
        address: map['address'] as String? ?? 'Default Address',
        lounge: map['lounge'] as bool? ?? false,
        monthlyRent: map['monthlyRent'] as String? ?? 'Default Monthly Rent',
        userId: map['user_id'] as String? ?? 'Default User ID',
      );
    } catch (e) {
      debugPrint('Error creating Property object from map: $e');
      return Property(
          bedrooms: "bedrooms",
          area: "area",
          title: "title",
          description: "description",
          address: "address",
          lounge: false,
          monthlyRent: "monthlyRent",
          userId: "user_id");
    }
  }

  // Convert the Property object to a JSON string
  String toJson() => json.encode(toMap());

  // Factory method to create a Property object from a JSON string
  factory Property.fromJson(String source) =>
      Property.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Property(bedrooms: $bedrooms, area: $area, title: $title, description: $description, address: $address, lounge: $lounge, monthlyRent: $monthlyRent, user_id: $userId)';
  }

  @override
  bool operator ==(covariant Property other) {
    if (identical(this, other)) return true;

    return other.bedrooms == bedrooms &&
        other.area == area &&
        other.title == title &&
        other.description == description &&
        other.address == address &&
        other.lounge == lounge &&
        other.monthlyRent == monthlyRent &&
        other.userId == userId;
  }

  @override
  int get hashCode {
    return bedrooms.hashCode ^
        area.hashCode ^
        title.hashCode ^
        description.hashCode ^
        address.hashCode ^
        lounge.hashCode ^
        monthlyRent.hashCode ^
        userId.hashCode;
  }
}
