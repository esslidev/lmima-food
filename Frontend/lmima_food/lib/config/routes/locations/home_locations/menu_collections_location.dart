import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:lmima_food/features/presentation/screens/menu_collections/menu_collections.dart';

import '../../../../core/constants/app_paths.dart';

class MenuCollectionsLocation extends BeamLocation<BeamState> {
  @override
  List<Pattern> get pathPatterns => [AppPaths.routes.menuCollectionsScreen];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final List<BeamPage> pages = [
      const BeamPage(
          key: ValueKey('menu-collections'),
          title: 'menu-collections',
          child: MenuCollectionsScreen()),
    ];
    return pages;
  }
}
