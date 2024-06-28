import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:lmima_food/features/presentation/screens/payment/payment.dart';

import '../../../../core/constants/app_paths.dart';

class PaymentLocation extends BeamLocation<BeamState> {
  @override
  List<Pattern> get pathPatterns => [AppPaths.routes.paymentScreen];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final List<BeamPage> pages = [
      const BeamPage(
          key: ValueKey('payment'), title: 'payment', child: PaymentScreen()),
    ];
    return pages;
  }
}
