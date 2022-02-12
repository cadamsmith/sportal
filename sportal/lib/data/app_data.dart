import 'package:flutter/material.dart';

import '../models/location.dart';

class AppData extends ChangeNotifier {
  Location? pickupLocation;

  void updatePickupLocation(Location location) {
    pickupLocation = location;
    notifyListeners();
  }
}
