import 'package:flutter/material.dart';

import '../enums/app_enums.dart';

class DropdownStyle {
  final double? width;
  final double? height;
  final EdgeInsets padding;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final Color? backgroundColor;
  final Radius borderRadius;
  final double elevation;
  final DropdownAlignment dropdownAlignment;

  DropdownStyle({
    this.width,
    this.height,
    this.padding = const EdgeInsets.all(0.0),
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.backgroundColor,
    this.borderRadius = const Radius.circular(6),
    this.elevation = 6,
    this.dropdownAlignment = DropdownAlignment.start,
  });
}
