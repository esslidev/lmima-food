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
  final int flex;
  final double? width;
  final double? height;

  const CustomField({
    Key? key,
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
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.flex = 1,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  State<CustomField> createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  late ResponsiveSizeAdapter R;

  @override
  void initState() {
    super.initState();
    R = ResponsiveSizeAdapter(context);
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Container(
      width: widget.width,
      height: widget.height,
      margin: widget.margin,
      padding: widget.padding,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(widget.borderRadius ?? 0.0),
        border: Border.all(
          color: widget.borderColor ?? Colors.transparent,
          width: widget.borderWidth,
        ),
      ),
      child: Flex(
        direction: widget.arrangement == FieldArrangement.row
            ? Axis.horizontal
            : Axis.vertical,
        mainAxisAlignment: widget.mainAxisAlignment,
        crossAxisAlignment: widget.crossAxisAlignment,
        children: widget.children,
      ),
    );

    return widget.isExpanded
        ? Expanded(flex: widget.flex, child: content)
        : content;
  }
}
