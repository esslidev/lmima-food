abstract class AppRouteEvent {
  const AppRouteEvent();
}

class UpdatePath extends AppRouteEvent {
  final String newPath;

  const UpdatePath(this.newPath);
}
