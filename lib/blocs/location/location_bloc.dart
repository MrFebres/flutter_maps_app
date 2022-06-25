import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  StreamSubscription<Position>? positionStream;

  LocationBloc() : super(const LocationState()) {
    on<NewUserLocationEvent>((event, emit) {
      emit(state.copyWith(
          lastKnownLocation: event.newLocation,
          myLocationHistory: [...state.myLocationHistory, event.newLocation]));
    });
  }

  Future getCurrentPosition() async {
    final position = await Geolocator.getCurrentPosition();

    add(
      NewUserLocationEvent(
        newLocation: LatLng(position.latitude, position.longitude),
      ),
    );
  }

  void startFollowingUser() {
    positionStream = Geolocator.getPositionStream().listen((event) {
      add(
        NewUserLocationEvent(
          newLocation: LatLng(event.latitude, event.longitude),
        ),
      );
    });
  }

  void stopFollowingUser() => positionStream?.cancel();

  @override
  Future<void> close() {
    stopFollowingUser();
    return super.close();
  }
}
