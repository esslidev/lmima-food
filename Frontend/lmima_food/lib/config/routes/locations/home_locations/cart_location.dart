import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:lmima_food/features/presentation/screens/cart/cart.dart';

import '../../../../core/constants/app_paths.dart';

class CartLocation extends BeamLocation<BeamState> {
  @override
  List<Pattern> get pathPatterns => [AppPaths.routes.cartScreen];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final List<BeamPage> pages = [
      const BeamPage(key: ValueKey('cart'), title: 'cart', child: CartScreen()),
    ];
    return pages;
  }
}
