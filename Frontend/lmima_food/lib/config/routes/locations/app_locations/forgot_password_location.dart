import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:lmima_food/features/presentation/screens/forgot_password/forgot_password.dart';

import '../../../../core/constants/app_paths.dart';

class ForgotPasswordLocation extends BeamLocation {
  @override
  List<Pattern> get pathPatterns => [AppPaths.routes.forgotPasswordScreen];

  @override
  List<BeamPage> buildPages(
      BuildContext context, RouteInformationSerializable state) {
    final List<BeamPage> pages = [
      const BeamPage(
          key: ValueKey('forgot-password'),
          title: 'forgot-password',
          child: ForgotPasswordScreen()),
    ];
    return pages;
  }
}
