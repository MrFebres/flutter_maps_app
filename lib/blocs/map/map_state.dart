part of 'map_bloc.dart';

class MapState extends Equatable {
  const MapState({
    this.isFollowingUser = true,
    this.isInitialized = false,
  });

  final bool isFollowingUser;
  final bool isInitialized;

  MapState copyWith({
    bool? isFollowingUser,
    bool? isInitialized,
  }) =>
      MapState(
        isFollowingUser: isFollowingUser ?? this.isFollowingUser,
        isInitialized: isInitialized ?? this.isInitialized,
      );

  @override
  List<Object> get props => [isFollowingUser, isInitialized];
}
