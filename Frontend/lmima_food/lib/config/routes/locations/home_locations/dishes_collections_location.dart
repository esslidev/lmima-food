import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:lmima_food/features/presentation/screens/dish_collections/dish_collections.dart';

import '../../../../core/constants/app_paths.dart';

class DishesCollectionsLocation extends BeamLocation<BeamState> {
  @override
  List<Pattern> get pathPatterns => [AppPaths.routes.dishesCollectionsScreen];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final List<BeamPage> pages = [
      const BeamPage(
          key: ValueKey('dishes-collections'),
          title: 'dishes-collections',
          child: DishCollectionsScreen()),
    ];
    return pages;
  }
}
