import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:lmima_food/features/presentation/screens/sign_in/sign_in.dart';

import '../../../../core/constants/app_paths.dart';

class SignInLocation extends BeamLocation {
  @override
  List<Pattern> get pathPatterns => [AppPaths.routes.signInScreen];

  @override
  List<BeamPage> buildPages(
      BuildContext context, RouteInformationSerializable state) {
    final List<BeamPage> pages = [
      const BeamPage(
          key: ValueKey('sign-in'), title: 'sign-in', child: SignInScreen()),
    ];
    return pages;
  }
}
