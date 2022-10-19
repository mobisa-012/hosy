import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hosy/core/services/ambulance_type.dart';

class Ambulances extends Equatable {
  final String id;
  final String title;
  final bool isAvailable;
  final AmbulanceType ambulanceType;
  final LatLng position;

  const Ambulances(
      this.id, this.ambulanceType, this.isAvailable, this.position, this.title);

      const Ambulances.named(
        this.ambulanceType,
        this.id,
        this.isAvailable,
        this.position,
        this.title
      );

  @override
  List<Object> get props => [ambulanceType, id, title, position, isAvailable];
}
