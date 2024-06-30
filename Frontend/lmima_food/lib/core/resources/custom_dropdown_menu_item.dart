import 'package:flutter/material.dart';

class CustomDropdownMenuItem {
  final Widget child;
  final VoidCallback? onTap;

  CustomDropdownMenuItem({
    required this.child,
    this.onTap,
  });
}
