part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class ActivateManualMarker extends SearchEvent {}

class DeActivateManualMarker extends SearchEvent {}
