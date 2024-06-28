import 'package:flutter/material.dart';

import '../../../core/util/responsive_size_adapter.dart';

class CustomField extends StatefulWidget {
  final Color? backgroundColor;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? borderRadius;
  final double borderWidth;
  final Color? borderColor;
  final String arrangement; // 'row' or 'column'
  final List<Widget> children;

  const CustomField({
    super.key,
    this.backgroundColor,
    this.padding,
    this.margin,
    this.borderRadius,
    this.borderWidth = 1.0,
    this.borderColor,
    required this.arrangement,
    required this.children,
  }) : assert(arrangement == 'row' || arrangement == 'column',
            'Arrangement must be either "row" or "column"');

  @override
  State<CustomField> createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  late ResponsiveSizeAdapter R;

  @override
  Widget build(BuildContext context) {
    R = ResponsiveSizeAdapter(context);

    return Container(
      margin: widget.margin,
      padding: widget.padding,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(widget.borderRadius ?? 0.0),
        border: Border.all(
          color: widget.borderColor ?? Colors.black,
          width: widget.borderWidth,
        ),
      ),
      child: widget.arrangement == 'row'
          ? Row(
              children: widget.children,
            )
          : Column(
              children: widget.children,
            ),
    );
  }
}
