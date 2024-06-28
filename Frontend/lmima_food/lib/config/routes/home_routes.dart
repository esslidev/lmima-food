import 'package:beamer/beamer.dart';

import '../../core/constants/app_paths.dart';
import 'locations/home_locations/dashboard_location.dart';
import 'locations/home_locations/settings_location.dart';

class HomeRoutes {
  static final List<BeamLocation> _beamLocations = [
    DashboardLocation(),
    SettingsLocation(),
  ];

  static final homeBeamerDelegate = BeamerDelegate(
      initialPath: AppPaths.routes.dashboardScreen,
      transitionDelegate: const NoAnimationTransitionDelegate(),
      locationBuilder:
          BeamerLocationBuilder(beamLocations: _beamLocations).call,
      notFoundRedirectNamed: AppPaths.routes.badRoutingScreen);
}
