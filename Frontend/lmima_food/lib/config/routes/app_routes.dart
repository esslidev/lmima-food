import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:lmima_food/config/routes/locations/app_locations/forgot_password_location.dart';
import 'package:lmima_food/config/routes/locations/app_locations/intro_location.dart';
import 'package:lmima_food/config/routes/locations/app_locations/sign_in_location.dart';
import 'package:lmima_food/config/routes/locations/app_locations/sign_up_location.dart';

import '../../core/constants/app_paths.dart';
import '../../core/constants/shared_preference_keys.dart';
import '../../core/util/prefs_util.dart';
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
      guards: [
        BeamGuard(
          pathPatterns: [AppPaths.routes.signInScreen],
          check: (context, state) =>
              !PrefsUtil.containsKey(SharedPreferenceKeys.userAccessToken),
          beamToNamed: (_, __) => AppPaths.routes.dashboardScreen,
        ),
        BeamGuard(
          pathPatterns: [AppPaths.routes.signUpScreen],
          check: (context, state) =>
              !PrefsUtil.containsKey(SharedPreferenceKeys.userAccessToken),
          beamToNamed: (_, __) => AppPaths.routes.dashboardScreen,
        ),
        BeamGuard(
          pathPatterns: [AppPaths.routes.forgotPasswordScreen],
          check: (context, state) =>
              !PrefsUtil.containsKey(SharedPreferenceKeys.userAccessToken),
          beamToNamed: (_, __) => AppPaths.routes.dashboardScreen,
        ),
        BeamGuard(
          pathPatterns: [AppPaths.routes.wishlistScreen],
          check: (context, state) =>
              PrefsUtil.containsKey(SharedPreferenceKeys.userAccessToken),
          beamToNamed: (_, __) => AppPaths.routes.dashboardScreen,
        ),
        BeamGuard(
          pathPatterns: [AppPaths.routes.cartScreen],
          check: (context, state) =>
              PrefsUtil.containsKey(SharedPreferenceKeys.userAccessToken),
          beamToNamed: (_, __) => AppPaths.routes.dashboardScreen,
        ),
        BeamGuard(
          pathPatterns: [AppPaths.routes.paymentScreen],
          check: (context, state) =>
              PrefsUtil.containsKey(SharedPreferenceKeys.userAccessToken),
          beamToNamed: (_, __) => AppPaths.routes.dashboardScreen,
        ),
        BeamGuard(
          pathPatterns: [AppPaths.routes.userSettingsScreen],
          check: (context, state) =>
              PrefsUtil.containsKey(SharedPreferenceKeys.userAccessToken),
          beamToNamed: (_, __) => AppPaths.routes.dashboardScreen,
        ),
      ],
      locationBuilder:
          BeamerLocationBuilder(beamLocations: _beamLocations).call,
      notFoundRedirectNamed: AppPaths.routes.badRoutingScreen);
}
