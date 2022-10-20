import 'package:equatable/equatable.dart';

class PaymentMethod extends Equatable {
  final String id;
  final String title;
  final String icon;
  final String description;

  const PaymentMethod({required this.description, required this.icon, required this.id, required this.title});

  @override
  List<Object> get props => [id, icon, description, title];
}
