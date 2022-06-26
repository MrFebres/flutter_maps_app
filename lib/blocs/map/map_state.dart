part of 'map_bloc.dart';

class MapState extends Equatable {
  const MapState({
    Map<String, Polyline>? polylines,
    this.showMyRoute = false,
    this.isFollowingUser = true,
    this.isInitialized = false,
  }) : polylines = polylines ?? const {};

  final bool isFollowingUser;
  final bool isInitialized;
  final bool showMyRoute;
  final Map<String, Polyline> polylines;

  MapState copyWith({
    bool? isFollowingUser,
    bool? isInitialized,
    bool? showMyRoute,
    Map<String, Polyline>? polylines,
  }) =>
      MapState(
        isFollowingUser: isFollowingUser ?? this.isFollowingUser,
        isInitialized: isInitialized ?? this.isInitialized,
        polylines: polylines ?? this.polylines,
        showMyRoute: showMyRoute ?? this.showMyRoute,
      );

  @override
  List<Object> get props => [
        isFollowingUser,
        isInitialized,
        polylines,
        showMyRoute,
      ];
}
