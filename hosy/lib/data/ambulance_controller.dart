import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hosy/core/services/ambulance.dart';
import 'package:hosy/core/services/ambulance_type.dart';

class AmbulanceController {
  static Future<List<Ambulances>> getAmbulances() async {
    return [
      const Ambulances.named(
        ambulanceType: AmbulanceType.standard, 
        id: 1, 
        isAvailable: true, 
        position: LatLng(35.42796133580664, -122.085749655962),
        title: 'Standard', 
        plateNo: ''),
        const Ambulances.named(
        ambulanceType: AmbulanceType.premium, 
        id: 1, 
        isAvailable: true, 
        position: LatLng(25.42796133580664, -100.085749655962),
        title: 'Standard', 
        plateNo: ''),
        const Ambulances.named(
        ambulanceType: AmbulanceType.standard, 
        id: 1, 
        isAvailable: true, 
        position: LatLng(30.42796133580664, -90.085749655962),
        title: 'Standard', 
        plateNo: ''),
        const Ambulances.named(
        ambulanceType: AmbulanceType.platinum, 
        id: 1, 
        isAvailable: true, 
        position: LatLng(47.42796133580664, -105.085749655962),
        title: 'Standard', 
        plateNo: ''),
    ];
  }
}
