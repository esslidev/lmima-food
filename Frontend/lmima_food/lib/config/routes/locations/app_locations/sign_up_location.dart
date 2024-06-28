import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:lmima_food/features/presentation/screens/sign_up/sign_up.dart';

import '../../../../core/constants/app_paths.dart';

class SignUpLocation extends BeamLocation {
  @override
  List<Pattern> get pathPatterns => [AppPaths.routes.signUpScreen];

  @override
  List<BeamPage> buildPages(
      BuildContext context, RouteInformationSerializable state) {
    final List<BeamPage> pages = [
      const BeamPage(
          key: ValueKey('sign-up'), title: 'sign-up', child: SignUpScreen()),
    ];
    return pages;
  }
}
