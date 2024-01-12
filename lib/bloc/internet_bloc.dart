// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:connectivity/connectivity.dart';
part 'internet_event.dart';
part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  InternetBloc() : super(InternetInitial()) {
    Connectivity connection = Connectivity();
    on<InternetGainedEvent>((event, emit) {
      emit(InternetGainedState());
    });

    on<InternetlostEvent>((event, emit) {
      emit(InternetlostState());
    });

    connection.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        add(InternetGainedEvent());
      } else {
        add(InternetlostEvent());
      }
    });
  }
}
