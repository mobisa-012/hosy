import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hosy/core/services/user_location.dart';
import 'package:location/location.dart';

class UserLocationController {
  static Future<LatLng?> getCurrentLocation() async {
    Location location = Location();
    bool check = (await location.hasPermission()) as bool;
    if (!check) {
      bool result = (await location.requestPermission()) as bool;
      if (result) {
        LocationData position = await location.getLocation();
        return LatLng(position.latitude, position.longitude);
      }
    }
    return null;
  }

  static Future<List<UserLocation>> getSavedLocations() async {
    return [
      UserLocation.named(
        name: 'Home', 
        locationType: UserLocationType.home, 
        minutesFar: 5, 
        position: const LatLng(0,0)),

      UserLocation.named(
        name: 'Cooperative University', 
        locationType: UserLocationType.work, 
        minutesFar: 9, 
        position: const LatLng(0,0))
    ];
  }
}