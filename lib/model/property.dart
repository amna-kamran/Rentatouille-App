// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Property {
  final String bedrooms;
  final String area;
  final String title;
  final String description;
  final String address;
  final bool lounge;
  final String monthlyRent;
  Property({
    required this.bedrooms,
    required this.area,
    required this.title,
    required this.description,
    required this.address,
    required this.lounge,
    required this.monthlyRent,
  });

  Property copyWith({
    String? bedrooms,
    String? area,
    String? title,
    String? description,
    String? address,
    bool? lounge,
    String? monthlyRent,
  }) {
    return Property(
      bedrooms: bedrooms ?? this.bedrooms,
      area: area ?? this.area,
      title: title ?? this.title,
      description: description ?? this.description,
      address: address ?? this.address,
      lounge: lounge ?? this.lounge,
      monthlyRent: monthlyRent ?? this.monthlyRent,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'bedrooms': bedrooms,
      'area': area,
      'title': title,
      'description': description,
      'address': address,
      'lounge': lounge,
      'monthlyRent': monthlyRent,
    };
  }

  factory Property.fromMap(Map<String, dynamic> map) {
    return Property(
      bedrooms: map['bedrooms'] as String,
      area: map['area'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      address: map['address'] as String,
      lounge: map['lounge'] as bool,
      monthlyRent: map['monthlyRent'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Property.fromJson(String source) =>
      Property.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Property(bedrooms: $bedrooms, area: $area, title: $title, description: $description, address: $address, lounge: $lounge, monthlyRent: $monthlyRent)';
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
        other.monthlyRent == monthlyRent;
  }

  @override
  int get hashCode {
    return bedrooms.hashCode ^
        area.hashCode ^
        title.hashCode ^
        description.hashCode ^
        address.hashCode ^
        lounge.hashCode ^
        monthlyRent.hashCode;
  }
}
