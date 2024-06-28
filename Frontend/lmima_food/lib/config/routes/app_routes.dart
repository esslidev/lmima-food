import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:lmima_food/config/routes/locations/app_locations/forgot_password_location.dart';
import 'package:lmima_food/config/routes/locations/app_locations/intro_location.dart';
import 'package:lmima_food/config/routes/locations/app_locations/sign_in_location.dart';
import 'package:lmima_food/config/routes/locations/app_locations/sign_up_location.dart';

import '../../core/constants/app_paths.dart';
import 'locations/app_locations/bad_routing.dart';
import 'locations/app_locations/home_location.dart';

class AppRoutes {
  static final List<BeamLocation> _beamLocations = [
    SignInLocation(),
    SignUpLocation(),
    ForgotPasswordLocation(),
    IntroLocation(),
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
