import 'package:flutter/material.dart';

class ResponsiveSizeAdapter {
  final BuildContext context;

  ResponsiveSizeAdapter(this.context);

  double size(double baseSize) {
    try {
      double shortestSide = MediaQuery.of(context).size.shortestSide;
      const double referenceScreenWidth = 720.0;
      double screenWidthRatio = shortestSide / referenceScreenWidth;
      return baseSize * screenWidthRatio;
    } catch (error) {
      return 0;
    }
  }

  EdgeInsets padding(double basePadding) {
    double responsivePadding = size(basePadding);
    return EdgeInsets.all(responsivePadding);
  }
}
