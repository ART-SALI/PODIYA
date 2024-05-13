import 'package:flutter/material.dart';

class Event {
  int? id;
  double? rating;
  String? name;
  String? description;
  double? price;
  String? image;
  String? location;
  DateTime? time;
  DateTime? created_at;
  int? city;
  int? creator;
  List<dynamic>? tags;

  Event(
      {this.id,
      this.rating,
      this.name,
      this.description,
      this.price,
      this.image,
      this.location,
      this.time,
      this.created_at,
      this.city,
      this.creator,
      this.tags});
}
