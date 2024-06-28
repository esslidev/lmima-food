import 'package:flutter/material.dart';

import '../../../../core/enums/app_enums.dart';
import '../../../../core/util/responsive_size_adapter.dart';

class CustomField extends StatefulWidget {
  final Color? backgroundColor;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? borderRadius;
  final double borderWidth;
  final Color? borderColor;
  final FieldArrangement arrangement; // 'row' or 'column'
  final List<Widget> children;
  final bool isExpanded;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  const CustomField({
    super.key,
    this.backgroundColor,
    this.padding,
    this.margin,
    this.borderRadius,
    this.borderWidth = 0.0,
    this.borderColor,
    required this.arrangement,
    required this.children,
    this.isExpanded = false,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  @override
  State<CustomField> createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  late ResponsiveSizeAdapter R;

  @override
  Widget build(BuildContext context) {
    R = ResponsiveSizeAdapter(context);

    Widget content = Container(
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
      child: widget.arrangement == FieldArrangement.row
          ? Row(
              mainAxisAlignment: widget.mainAxisAlignment,
              crossAxisAlignment: widget.crossAxisAlignment,
              children: widget.children,
            )
          : Column(
              mainAxisAlignment: widget.mainAxisAlignment,
              crossAxisAlignment: widget.crossAxisAlignment,
              children: widget.children,
            ),
    );

    return widget.isExpanded ? Expanded(child: content) : content;
  }
}
