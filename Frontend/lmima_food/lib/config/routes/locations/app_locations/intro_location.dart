import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:lmima_food/features/presentation/screens/intro/intro.dart';

import '../../../../core/constants/app_paths.dart';

class IntroLocation extends BeamLocation {
  @override
  List<Pattern> get pathPatterns => [AppPaths.routes.introScreen];

  @override
  List<BeamPage> buildPages(
      BuildContext context, RouteInformationSerializable state) {
    final List<BeamPage> pages = [
      const BeamPage(
          key: ValueKey('intro'), title: 'intro', child: IntroScreen()),
    ];
    return pages;
  }
}
