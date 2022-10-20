import 'package:equatable/equatable.dart';

class AmbulanceDriver extends Equatable {
  final String id;
  final String driverName;
  final double driverRating;
  final String ambulanceDetails;
  final String driverPic;

  const AmbulanceDriver(
    this.id,
    this.ambulanceDetails,
    this.driverName,
    this.driverPic,
    this.driverRating,
  );
  const AmbulanceDriver.named(
      {required this.ambulanceDetails,
      required this.driverName,
      required this.driverPic,
      required this.driverRating,
      required this.id});
  @override
  List<Object> get props => [id, driverName, driverPic, driverRating, ambulanceDetails];
}
