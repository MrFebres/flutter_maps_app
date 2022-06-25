part of 'map_bloc.dart';

abstract class MapEvent extends Equatable {
  const MapEvent();

  @override
  List<Object> get props => [];
}

class InitializedMap extends MapEvent {
  const InitializedMap(this.controller);

  final GoogleMapController controller;
}
