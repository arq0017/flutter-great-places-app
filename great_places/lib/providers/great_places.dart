import 'package:flutter/foundation.dart';
import 'package:great_places/models%20/place.dart';
import 'dart:io';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];
  List<Place> get items {
    //! Max used spread operator
    return _items;
  }

  void addPlace({String title, File image}) {
    final newPlace = Place(DateTime.now().toString(), title, null, image);
    _items.add(newPlace);
    notifyListeners(); 
  }
}
