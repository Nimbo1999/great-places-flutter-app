import 'dart:io';

class Location {
  final double latitude;
  final double longitude;
  final String? address;

  Location({ required this.longitude, required this.latitude, this.address });
}

class Place {
  final String id;
  final String title;
  final Location location;
  final File image;

  Place({ required this.id, required this.title, required this.image, required this.location });
}