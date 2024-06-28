class AppPaths {
  static FontsPaths get fonts => FontsPaths();

  static IconsPaths get icons => IconsPaths();

  static ImagesPaths get images => ImagesPaths();

  static VectorsPaths get vectors => VectorsPaths();

  static RoutesPaths get routes => RoutesPaths();
}

class FontsPaths {
  final String robotoBold = 'assets/fonts/roboto-bold.ttf';
  final String robotoBoldItalic = 'assets/fonts/roboto-bolditalic.ttf';
  final String robotoItalic = 'assets/fonts/roboto-italic.ttf';
  final String robotoRegular = 'assets/fonts/roboto-regular.ttf';
}

class IconsPaths {
  final String favIcon = 'assets/icons/favicon.png';
  final String icon = 'assets/icons/icon.png';
}

class ImagesPaths {
  final String defaultProfilePicture =
      'assets/images/default-profile-picture.jpg';
}

class VectorsPaths {
// Home nav icons paths
  final String homeIcon = 'assets/vectors/home-icon.svg';
  final String dashboardIcon = 'assets/vectors/dashboard-icon.svg';
  final String settingsIcon = 'assets/vectors/settings-icon.svg';
  final String signOutIcon = 'assets/vectors/sign-out-icon.svg';
  final String greaterThanIcon = 'assets/vectors/greater-than-icon.svg';
}

class RoutesPaths {
  final String signInScreen = '/sign-in';
  final String signUpScreen = '/sign-up';
  final String forgotPasswordScreen = '/forgot-password';
  final String introScreen = '/intro';
  final String homeScreen = '/home';
  final String dashboardScreen = '/home/dashboard';
  final String menuCollectionsScreen = '/home/menu-collections';
  final String menuDetailsScreen = '/home/menu-collections/menu-details';
  final String dishesCollectionsScreen = '/home/dishes-collections';
  final String dishDetailsScreen = '/home/dishes-collections/dish-details';
  final String blogScreen = '/home/blog';
  final String wishlistScreen = '/home/wishlist';
  final String cartScreen = '/home/cart';
  final String paymentScreen = '/home/payment';
  final String userSettingsScreen = '/home/user-settings';
  final String contactScreen = '/home/contact';
  final String ourPoliciesScreen = '/home/our-policies';
  final String badRoutingScreen = '/bad-routing';

  String getRouteName(String route) {
    switch (route) {
      case '/sign-in':
        return 'Sign In';
      case '/sign-up':
        return 'Sign Up';
      case '/forgot-password':
        return 'Forgot Password';
      case '/intro':
        return 'Introduction';
      case '/home':
        return 'Home';
      case '/home/dashboard':
        return 'Dashboard';
      case '/home/menu-collections':
        return 'Menu Collections';
      case '/home/menu-collections/menu-details':
        return 'Menu Details';
      case '/home/dishes-collections':
        return 'Dishes Collections';
      case '/home/dishes-collections/dish-details':
        return 'Dish Details';
      case '/home/blog':
        return 'Blog';
      case '/home/wishlist':
        return 'Wishlist';
      case '/home/cart':
        return 'Cart';
      case '/home/payment':
        return 'Payment';
      case '/home/user-settings':
        return 'User Settings';
      case '/home/contact':
        return 'Contact';
      case '/home/our-policies':
        return 'Our Policies';
      case '/bad-routing':
        return 'Bad Routing';
      default:
        return 'Unknown Route';
    }
  }
}
