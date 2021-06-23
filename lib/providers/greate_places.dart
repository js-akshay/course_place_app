import 'package:flutter/foundation.dart';
import 'package:place_app_new/models/place.dart';

class GreatePlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }
}
