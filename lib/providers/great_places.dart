import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:great_places/helpers/db_helper.dart';

import '../models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get item {
    return [..._items];
  }

  void addPlace(String title, File image) {
    final newPlace = Place(id: DateTime.now().toString(), image: image, title: title, location: null);
    _items.add(newPlace);
    notifyListeners();
    DBHelper.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path
    });
  }

  Future<void> fetchAndSetPlaces() async {
    final dataList = await DBHelper.getData('user_places');
    _items = dataList.map((place) => Place(id: place['id'], image: File(place['image']), location: null, title: place['title'])).toList();
    notifyListeners();
  }
}