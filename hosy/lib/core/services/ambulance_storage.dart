import 'package:hosy/core/services/ambulance_booking.dart';

class AmbulanceBookingStoragee {
  static late AmbulanceBooking ambulanceBooking;

  static Future<void> open() async {
    ambulanceBooking = AmbulanceBooking.named();
  }

  static Future<AmbulanceBooking> addDetails(
      AmbulanceBooking ambulanceBooking) async {
    ambulanceBooking = ambulanceBooking.copyWith(ambulanceBooking);
    return ambulanceBooking;
  }

  static Future<AmbulanceBooking> getAmbulanceBooking() async {
    return ambulanceBooking;
  }
}
