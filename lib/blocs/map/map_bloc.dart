import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter_maps/blocs/blocs.dart';
import 'package:flutter_maps/theme/theme.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  final LocationBloc locationBloc;
  GoogleMapController? _mapController;
  StreamSubscription<LocationState>? locationStream;

  MapBloc({required this.locationBloc}) : super(const MapState()) {
    on<InitializedMap>(_onInitMap);

    on<StartFollowingUserInMap>(_onStartFollowingUser);

    on<StopFollowingUserInMap>(
      ((_, emit) => emit(
            state.copyWith(isFollowingUser: false),
          )),
    );

    on<UpdatePolylines>(_onPolylineNewPoint);

    on<ToggleShowRoute>(
      (_, emit) => emit(
        state.copyWith(showMyRoute: !state.showMyRoute),
      ),
    );

    locationStream = locationBloc.stream.listen((locationState) {
      if (locationState.lastKnownLocation != null) {
        add(UpdatePolylines(locationState.myLocationHistory));
      }

      if (!state.isFollowingUser) return;

      if (locationState.lastKnownLocation == null) return;

      moveCamera(locationState.lastKnownLocation!);
    });
  }

  void _onInitMap(InitializedMap event, Emitter<MapState> emit) {
    _mapController = event.controller;

    _mapController!.setMapStyle(jsonEncode(uberMapTheme));

    emit(state.copyWith(isInitialized: true));
  }

  void _onStartFollowingUser(
    StartFollowingUserInMap event,
    Emitter<MapState> emit,
  ) {
    emit(state.copyWith(isFollowingUser: true));

    if (locationBloc.state.lastKnownLocation == null) return;

    moveCamera(locationBloc.state.lastKnownLocation!);
  }

  void _onPolylineNewPoint(
    UpdatePolylines event,
    Emitter<MapState> emit,
  ) {
    final myRoute = Polyline(
      color: Colors.black,
      endCap: Cap.roundCap,
      points: event.userHistoryLocations,
      polylineId: const PolylineId('myRoute'),
      startCap: Cap.roundCap,
      width: 5,
    );

    final currentPolylines = Map<String, Polyline>.from(state.polylines);
    currentPolylines['myRoute'] = myRoute;

    emit(state.copyWith(polylines: currentPolylines));
  }

  void moveCamera(LatLng newLocation) {
    final cameraUpdate = CameraUpdate.newLatLng(newLocation);
    _mapController?.animateCamera(cameraUpdate);
  }

  @override
  Future<void> close() {
    locationStream?.cancel();
    return super.close();
  }
}
