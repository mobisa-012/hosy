import 'package:equatable/equatable.dart';
import 'package:hosy/core/services/ambulance.dart';
import 'package:hosy/core/services/ambulance_booking.dart';
import 'package:hosy/core/services/ambulance_driver.dart';
import 'package:hosy/core/services/payment_method.dart';

abstract class AmbulanceBookingState extends Equatable {
  const AmbulanceBookingState();
}

class AmbulanceBookingNotInitialzedState extends AmbulanceBookingState {
  const AmbulanceBookingNotInitialzedState();
  @override
  List<Object> get props => null;
}

class AmbulanceBookingNotSelectedState extends AmbulanceBookingState {
  final List<Ambulances> ambulancesAvailable;

  const AmbulanceBookingNotSelectedState({required this.ambulancesAvailable});

  @override
  List<Object> get props => null;
}

class DetailsNotFilledState extends AmbulanceBookingState {
  final AmbulanceBooking booking;

  const DetailsNotFilledState({required this.booking});
  @override
  List<Object> get props => [booking];
}

class AmbulanceBookingLoadingState extends AmbulanceBookingState {
  final AmbulanceBookingState state;

  const AmbulanceBookingLoadingState({required this.state});
  @override
  List<Object?> get props => [state];
}

class AmbulanceNotSelectedState extends AmbulanceBookingState {
  final AmbulanceBooking booking;

  const AmbulanceNotSelectedState({required this.booking, required List<Ambulances> ambulancesAvailable});

  @override
  List<Object> get props => [booking];
}

class PaymentNotInitializedState extends AmbulanceBookingState {
  final AmbulanceBooking booking;
  final List<PaymentMethod> methodsAvailable;

  const PaymentNotInitializedState(
      {required this.booking, required this.methodsAvailable});
  @override
  List<Object> get props => [booking, methodsAvailable];
}

class AmbulanceNotConfirmedState extends AmbulanceBookingState {
  final AmbulanceDriver driver;
  final AmbulanceBooking booking;

  const AmbulanceNotConfirmedState({required this.booking, required this.driver});
  @override
  List<Object> get props => [booking, driver];
}

class AmbulanceBookingConfirmedState extends AmbulanceBookingState {
  final AmbulanceDriver driver;
  final AmbulanceBooking booking;
  const AmbulanceBookingConfirmedState({required this.booking, required this.driver});
  @override
  List<Object> get props => [driver, booking];
}

class AmbulanceBookingCancelState extends AmbulanceBookingState {
  @override
  List<Object> get props => null;
}