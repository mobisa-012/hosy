import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hosy/data/doctors_data.dart';

part 'doctors_event.dart';
part 'doctors_state.dart';

class DoctorsBloc extends Bloc<DoctorsEvent, DoctorsState> {
  final DoctorData doctorData;

  DoctorsBloc({required this.doctorData}) : super(DoctorsInitial());

  Stream<DoctorsState> mapEventToState(DoctorsEvent event) async* {
    if (event is BackTappedEvent) {
      yield BackTappedState();
    } else if (event is DoctorCallTappedEvent) {
      yield DoctorCallTappedState();
    }
  }
}
