class RoutePathService {
  String _currentPath = '/';

  String get currentPath => _currentPath;

  void updatePath(String newPath) {
    _currentPath = newPath;
  }
}
