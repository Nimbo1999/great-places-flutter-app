import 'dart:io';

import 'package:flutter/cupertino.dart';

import '../models/place.dart';

class GreatPlaces with ChangeNotifier {
  final List<Place> _items = [];

  List<Place> get item {
    return [..._items];
  }

  void addPlace(String title, File image) {
    final newPlace = Place(id: DateTime.now().toString(), image: image, title: title, location: null);
    _items.add(newPlace);
    notifyListeners();
  }
}