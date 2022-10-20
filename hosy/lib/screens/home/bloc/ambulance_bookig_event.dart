import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hosy/core/services/ambulance_type.dart';
import 'package:hosy/core/services/payment_method.dart';

import '../../../core/services/google_location.dart';

abstract class AmbulanceBookingEvent extends Equatable {
  const AmbulanceBookingEvent();
}

class AmbulanceBookingStartEvent extends AmbulanceBookingEvent {
  @override
  List<Object> get props => null;
}

class DestinationSelectedEvent extends AmbulanceBookingEvent {
  final LatLng destination;

  const DestinationSelectedEvent({required this.destination});
  @override
  List<Object> get props => null;
}

class DetailsSubmittedEvent extends AmbulanceBookingEvent {
  final GoogleLocation source;
  final GoogleLocation destination;
  final int noOfPersons;
  final DateTime bookingTime;

  const DetailsSubmittedEvent(
      {required this.bookingTime,
      required this.destination,
      required this.noOfPersons,
      required this.source});

  @override
  List<Object> get props => [source, bookingTime, destination, noOfPersons];
}

class AmbulanceSelectedEvent extends AmbulanceBookingEvent {
  final AmbulanceType ambulanceType;

  const AmbulanceSelectedEvent({required this.ambulanceType});

  @override
  List<Object> get props => [ambulanceType];
}

class PaymentMadeEvent extends AmbulanceBookingEvent {
  final PaymentMethod paymentMethod;

  const PaymentMadeEvent({required this.paymentMethod});

  @override
  List<Object> get props => [paymentMethod];
}

class BackTappedEvent extends AmbulanceBookingEvent {
  @override
  List<Object> get props => null;
}

class AmbulanceCancelEvent extends AmbulanceBookingEvent{
  @override
  List<Object> get props => null;
}