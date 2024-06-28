import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import '../../core/constants/app_paths.dart';
import 'locations/app_locations/bad_routing.dart';
import 'locations/app_locations/home_location.dart';

class AppRoutes {
  static final List<BeamLocation> _beamLocations = [
    HomeLocation(),
    BadRoutingLocation()
  ];

  static final appBeamerDelegate = BeamerDelegate(
      initialPath: AppPaths.routes.dashboardScreen,
      transitionDelegate: const DefaultTransitionDelegate(),
      guards: [],
      locationBuilder:
          BeamerLocationBuilder(beamLocations: _beamLocations).call,
      notFoundRedirectNamed: AppPaths.routes.badRoutingScreen);
}
