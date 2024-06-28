import 'package:beamer/beamer.dart';
import 'package:lmima_food/config/routes/locations/home_locations/blog_location.dart';
import 'package:lmima_food/config/routes/locations/home_locations/cart_location.dart';
import 'package:lmima_food/config/routes/locations/home_locations/contact_location.dart';
import 'package:lmima_food/config/routes/locations/home_locations/dish_details_location.dart';
import 'package:lmima_food/config/routes/locations/home_locations/dishes_collections_location.dart';
import 'package:lmima_food/config/routes/locations/home_locations/menu_collections_location.dart';
import 'package:lmima_food/config/routes/locations/home_locations/menu_details_location.dart';
import 'package:lmima_food/config/routes/locations/home_locations/our_policies_location.dart';
import 'package:lmima_food/config/routes/locations/home_locations/payment_location.dart';
import 'package:lmima_food/config/routes/locations/home_locations/wishlist_location.dart';

import '../../core/constants/app_paths.dart';
import 'locations/home_locations/dashboard_location.dart';
import 'locations/home_locations/user_settings_location.dart';

class HomeRoutes {
  static final List<BeamLocation> _beamLocations = [
    DashboardLocation(),
    MenuCollectionsLocation(),
    MenuDetailsLocation(),
    DishesCollectionsLocation(),
    DishDetailsLocation(),
    BlogLocation(),
    WishlistLocation(),
    CartLocation(),
    PaymentLocation(),
    UserSettingsLocation(),
    ContactLocation(),
    OurPoliciesLocation(),
  ];

  static final homeBeamerDelegate = BeamerDelegate(
      initialPath: AppPaths.routes.dashboardScreen,
      transitionDelegate: const NoAnimationTransitionDelegate(),
      locationBuilder:
          BeamerLocationBuilder(beamLocations: _beamLocations).call,
      notFoundRedirectNamed: AppPaths.routes.badRoutingScreen);
}
