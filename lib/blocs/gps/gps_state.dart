part of 'gps_bloc.dart';

class GpsState extends Equatable {
  const GpsState({
    required this.isGpsEnabled,
    required this.isGpsPermissionGranted,
  });

  final bool isGpsEnabled;
  final bool isGpsPermissionGranted;

  bool get isAllGranted => isGpsEnabled && isGpsPermissionGranted;

  @override
  List<Object> get props => [isGpsEnabled, isGpsPermissionGranted];

  GpsState copyWith({
    bool? isGpsEnabled,
    bool? isGpsPermissionGranted,
  }) =>
      GpsState(
          isGpsEnabled: isGpsEnabled ?? this.isGpsEnabled,
          isGpsPermissionGranted:
              isGpsPermissionGranted ?? this.isGpsPermissionGranted);
}
