import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:lmima_food/features/presentation/screens/menu_details/menu_details.dart';

import '../../../../core/constants/app_paths.dart';

class MenuDetailsLocation extends BeamLocation<BeamState> {
  @override
  List<Pattern> get pathPatterns => [AppPaths.routes.menuDetailsScreen];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final List<BeamPage> pages = [
      const BeamPage(
          key: ValueKey('menu-details'),
          title: 'menu-details',
          child: MenuDetailsScreen()),
    ];
    return pages;
  }
}
