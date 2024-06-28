import 'package:equatable/equatable.dart';

abstract class AppRouteState extends Equatable {
  const AppRouteState();

  @override
  List<Object> get props => [];
}

class AppRouteInitial extends AppRouteState {
  const AppRouteInitial();
}

class AppRoutePathUpdated extends AppRouteState {
  const AppRoutePathUpdated();
}
