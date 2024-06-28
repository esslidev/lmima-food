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
  final String homeScreen = '/home';
  final String dashboardScreen = '/home/dashboard';
  final String settingsScreen = '/home/settings';
  final String badRoutingScreen = '/bad-routing';

  String getRouteName(String route) {
    switch (route) {
      case '/sign-in':
        return 'Sign In';
      case '/home':
        return 'Home';
      case '/home/dashboard':
        return 'Dashboard';
      case '/home/user-management':
        return 'User Management';
      case '/home/meal-plans':
        return 'Meal Plans';
      case '/home/fitness-plans':
        return 'Fitness Plans';
      case '/home/settings':
        return 'Settings';
      case '/bad-routing':
        return 'Bad Routing';
      default:
        return 'Unknown Route';
    }
  }
}
