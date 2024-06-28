import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/util/route_path_service.dart';
import 'route_event.dart';
import 'route_state.dart';

class AppRouteBloc extends Bloc<AppRouteEvent, AppRouteState> {
  final RoutePathService _routePathService;

  AppRouteBloc(this._routePathService) : super(const AppRouteInitial()) {
    on<UpdatePath>(onUpdatePath);
  }

  void onUpdatePath(UpdatePath event, Emitter<AppRouteState> emit) async {
    emit(const AppRouteInitial());
    _routePathService.updatePath(event.newPath);
    emit(const AppRoutePathUpdated());
  }
}
