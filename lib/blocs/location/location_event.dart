part of 'location_bloc.dart';

abstract class LocationEvent extends Equatable {
  const LocationEvent();

  @override
  List<Object> get props => [];
}

class NewUserLocationEvent extends LocationEvent {
  const NewUserLocationEvent({required this.newLocation});

  final LatLng newLocation;
}

class StartFollowingUser extends LocationEvent {}

class StopFollowingUser extends LocationEvent {}
