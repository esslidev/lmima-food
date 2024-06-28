import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:lmima_food/features/presentation/screens/dish_details/dish_details.dart';

import '../../../../core/constants/app_paths.dart';

class DishDetailsLocation extends BeamLocation<BeamState> {
  @override
  List<Pattern> get pathPatterns => [AppPaths.routes.dishDetailsScreen];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final List<BeamPage> pages = [
      const BeamPage(
          key: ValueKey('dish-details'),
          title: 'dish-details',
          child: DishDetailsScreen()),
    ];
    return pages;
  }
}
