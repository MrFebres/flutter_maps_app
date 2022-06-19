part of 'gps_bloc.dart';

class GpsState extends Equatable {
  const GpsState({
    required this.isGpsEnabled,
    required this.isGpsPermissionGranted,
  });

  final bool isGpsEnabled;
  final bool isGpsPermissionGranted;

  @override
  List<Object> get props => [isGpsEnabled, isGpsPermissionGranted];
}
