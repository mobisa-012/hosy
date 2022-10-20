import 'package:google_maps_flutter/google_maps_flutter.dart';

enum UserLocationType { home, work }

class UserLocation {
  final String name;
  final UserLocationType locationType;
  final LatLng position;
  final int minutesFar;

  UserLocation({required this.name, required this.locationType, required this.minutesFar, required this.position});

  UserLocation.named(
    {required this.name,
    required this.locationType,
    required this.minutesFar,
    required this.position}
  );
}
