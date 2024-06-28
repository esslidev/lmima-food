import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:lmima_food/features/presentation/screens/our_policies/our_policies.dart';

import '../../../../core/constants/app_paths.dart';

class OurPoliciesLocation extends BeamLocation<BeamState> {
  @override
  List<Pattern> get pathPatterns => [AppPaths.routes.ourPoliciesScreen];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final List<BeamPage> pages = [
      const BeamPage(
          key: ValueKey('our-policies'),
          title: 'our-policies',
          child: OurPoliciesScreen()),
    ];
    return pages;
  }
}
