import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hosy/core/services/ambulance_type.dart';

class Ambulances extends Equatable {
  final int id;
  final String title;
  final bool isAvailable;
  final String plateNo;
  final AmbulanceType ambulanceType;
  final LatLng position;

  const Ambulances(
      this.id, this.ambulanceType, this.isAvailable, this.position, this.title, this.plateNo);

  const Ambulances.named({
    required this.ambulanceType,
    required this.id,
    required this.isAvailable,
    required this.position,
    required this.title, 
    required this.plateNo,
  });

  @override
  List<Object> get props => [ambulanceType, id, title,plateNo, position, isAvailable];
}
