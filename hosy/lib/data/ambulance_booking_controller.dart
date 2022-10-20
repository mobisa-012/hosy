import 'dart:math';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hosy/core/const/path_constants.dart';
import 'package:hosy/core/services/ambulance.dart';
import 'package:hosy/core/services/ambulance_booking.dart';
import 'package:hosy/core/services/ambulance_driver.dart';
import 'package:hosy/core/services/ambulance_type.dart';
import 'package:hosy/core/services/google_location.dart';
import 'package:hosy/data/location_controller.dart';

class AmbulanceBookingController {
  static Future<double> getPrice(AmbulanceBooking booking) async {
    return 200;
  }

  static Future<AmbulanceDriver> getAmbulanceDriver(
      AmbulanceBooking booking) async {
    return const AmbulanceDriver.named(
        ambulanceDetails: 'Toyota (KBN 876Z)',
        driverName: 'Yvonne Mobisa',
        driverPic: PathConstants.profile1,
        driverRating: 4.0,
        id: '3969-275');
  }

  static Future<List<Ambulances>> getAmbulancesAvailable() async {
    GoogleLocation location = await LocationController.getCurrentLocation();
    // ignore: unused_local_variable
    const double maxRadius = 200 / 111300;
    Random random = Random();
    List<Ambulances> ambulances = List<Ambulances>.generate(10, (index) {
      double u = random.nextDouble();
      double v = random.nextDouble();
      double w = random.nextDouble();
      double t = random.nextDouble();
      double x1 = random.nextDouble();
      double y1 = random.nextDouble();
      x1 = x1 / cos(y1);
      LatLng oldPos = location.position;
      return Ambulances.named(
        ambulanceType: AmbulanceType.standard, 
        id: index, 
        isAvailable: true, 
        position: LatLng(x1 + oldPos.latitude, y1 + oldPos.longitude), 
        title: "Ambulance $index",
        plateNo: 'KBD 643T',
        );
    });
    return ambulances;
  }
}
