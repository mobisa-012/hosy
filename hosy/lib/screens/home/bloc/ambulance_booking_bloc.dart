import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hosy/core/services/ambulance.dart';
import 'package:hosy/core/services/ambulance_booking.dart';
import 'package:hosy/core/services/ambulance_driver.dart';
import 'package:hosy/core/services/google_location.dart';
import 'package:hosy/core/services/payment_method.dart';
import 'package:hosy/data/ambulance_booking_controller.dart';
import 'package:hosy/data/location_controller.dart';
import 'package:hosy/data/payment_method_controller.dart';
import 'package:hosy/screens/home/bloc/ambulance_bookig_event.dart';
import 'package:hosy/screens/home/bloc/ambulance_booking_state.dart';

class AmbulanceBookingBloc
    extends Bloc<AmbulanceBookingEvent, AmbulanceBookingState> {
  AmbulanceBookingBloc(super.initialState);

  AmbulanceBookingState get intialState => const AmbulanceBookingNotInitialzedState();

  Stream<AmbulanceBookingState> mapEventToState(
      AmbulanceBookingEvent event) async* {
    if (event is AmbulanceBookingStartEvent) {
      List<Ambulances> ambulances =
          await AmbulanceBookingController.getAmbulancesAvailable();
      yield AmbulanceBookingNotSelectedState(ambulancesAvailable: ambulances);
    }
    if (event is DestinationSelectedEvent) {
      AmbulanceBookingStorage.open();
      // ignore: prefer_const_constructors
      yield AmbulanceBookingLoadingState(
          state: const DetailsNotFilledState(booking: null));

      GoogleLocation source = await LocationController.getCurrentLocation();
      GoogleLocation destination =
          await LocationContoller.getLocationfromId(event.destination);
      await AmbulanceBookingStorage.addDetails(AmbulanceBooking.named(
          source: source, destination: destination, noOfPersons: 1));
      AmbulanceBooking ambulanceBooking =
          await AmbulanceBookingStorage.getAmbulanceBooking();
      yield DetailsNotFilledState(booking: ambulanceBooking);
    }
    if (event is DetailsSubmittedEvent) {
      yield const AmbulanceBookingLoadingState(
          state: AmbulanceNotSelectedState(booking: null));
      await Future.delayed(const Duration(seconds: 1));
      await AmbulanceBookingStorage.addDetails(AmbulanceBooking.named(
          source: event.source,
          destination: event.destination,
          noOfPersons: event.noOfPersons,
          bookingTime: event.bookingTime));
      AmbulanceBooking booking =
          await AmbulanceBookingStorage.getAmbulanceBooking();
      yield AAmbulanceNotSelectedState(booking: booking);
    }
    if (event is AmbulanceSelectedEvent) {
      yield const AmbulanceBookingLoadingState(
          state:
              PaymentNotInitializedState(booking: null, methodsAvailable: []));
      AmbulanceBooking prevBooking =
          await AmbulanceBookingStorage.getAmbulanceBooking();
      double price = await AmbulanceBookingController.getPrice(prevBooking);
      await AmbulanceBookingStorage.addDetails(AmbulanceBooking.named(
          ambulanceType: event.ambulanceType, estimatedPrice: price));
      AmbulanceBooking booking =
          await AmbulanceBookingStorage.getAmbulanceBooking();
      List<PaymentMethod> methods = await PaymentMethodController.getMethods();
      yield PaymentNotInitializedState(
          booking: booking, methodsAvailable: methods);
    }
    if (event is PaymentMadeEvent) {
      yield  const AmbulanceBookingLoadingState(
          state:
              PaymentNotInitializedState(booking: [], methodsAvailable: []));
      AmbulanceBooking booking = await AmbulanceBookingStorage.addDetails(
          AmbulanceBooking.named(paymentMethod: event.paymentMethod));
      AmbulanceDriver ambulanceDriver =
          await AmbulanceBookingController.getAmbulanceDriver(booking);
      yield AmbulanceNotConfirmedState(
          booking: booking, driver: ambulanceDriver);
      await Future.delayed(const Duration(seconds: 1));
      yield AmbulanceBookingConfirmedState(
          booking: booking, driver: ambulanceDriver);
    }
    if (event is AmbulanceCancelEvent) {
      yield AmbulanceBookingCancelState();
      await Future.delayed(const Duration(milliseconds: 500));
      List<Ambulances> ambulances =
          await AmbulanceBookingController.getAmbulancesAvailable();
      yield AmbulanceNotSelectedState(ambulancesAvailable: ambulances, booking: []);
    }
    if (event is BackTappedEvent) {
      switch (state.runtimeType) {
        case DetailsNotFilledState:
          List<Ambulances> ambulances =
              await AmbulanceBookingController.getAmbulancesAvailable();
          yield AmbulanceBookingNotSelectedState(
              ambulancesAvailable: ambulances);
          break;
        case PaymentNotInitializedState:
          yield AmbulanceNotSelectedState(
              booking: (state as PaymentNotInitializedState).booking, ambulancesAvailable: []);
          break;
        case AmbulanceNotSelectedState:
          yield DetailsNotFilledState(
              booking: (state as AmbulanceNotSelectedState).booking);
          break;
      }
    }
  }
}
