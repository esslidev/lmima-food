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
  final FieldArrangement arrangement; // 'row', 'column', or 'position'
  final List<Widget> children;
  final bool isExpanded;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final int flex;
  final double? width;
  final double? height;
  final double gap; // New gap parameter
  final bool wrap; // New wrap parameter

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
    this.gap = 0.0, // Default value for gap
    this.wrap = false, // Default value for wrap
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
    Widget content;

    switch (widget.arrangement) {
      case FieldArrangement.row:
      case FieldArrangement.column:
        List<Widget> spacedChildren = [];
        for (int i = 0; i < widget.children.length; i++) {
          spacedChildren.add(widget.children[i]);
          if (i < widget.children.length - 1) {
            spacedChildren.add(SizedBox(
              width: widget.arrangement == FieldArrangement.row && !widget.wrap
                  ? widget.gap
                  : 0,
              height:
                  widget.arrangement == FieldArrangement.column && !widget.wrap
                      ? widget.gap
                      : 0,
            ));
          }
        }

        content = Flex(
          direction: widget.arrangement == FieldArrangement.row
              ? Axis.horizontal
              : Axis.vertical,
          mainAxisAlignment: widget.mainAxisAlignment,
          crossAxisAlignment: widget.crossAxisAlignment,
          children: spacedChildren,
        );
        break;
      case FieldArrangement.position:
        content = Stack(
          children: widget.children.map((child) {
            // Example of handling positioned widgets by checking key type
            if (child.key is Key &&
                (child.key as Key).toString() == 'Positioned') {
              return child;
            } else {
              return Positioned(
                left: 50.0, // Example left position
                top: 50.0, // Example top position
                child: child,
              );
            }
          }).toList(),
        );
        break;
    }

    return Container(
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
      child: widget.wrap && widget.arrangement == FieldArrangement.row
          ? Wrap(
              spacing: widget.gap,
              runSpacing: widget.gap,
              alignment: widget.mainAxisAlignment.wrapAlignment,
              crossAxisAlignment: widget.crossAxisAlignment.wrapCrossAlignment,
              children: widget.children,
            )
          : content,
    );
  }
}

extension on MainAxisAlignment {
  WrapAlignment get wrapAlignment {
    switch (this) {
      case MainAxisAlignment.start:
        return WrapAlignment.start;
      case MainAxisAlignment.end:
        return WrapAlignment.end;
      case MainAxisAlignment.center:
        return WrapAlignment.center;
      case MainAxisAlignment.spaceBetween:
        return WrapAlignment.spaceBetween;
      case MainAxisAlignment.spaceAround:
        return WrapAlignment.spaceAround;
      case MainAxisAlignment.spaceEvenly:
        return WrapAlignment.spaceEvenly;
    }
  }
}

extension on CrossAxisAlignment {
  WrapCrossAlignment get wrapCrossAlignment {
    switch (this) {
      case CrossAxisAlignment.start:
        return WrapCrossAlignment.start;
      case CrossAxisAlignment.end:
        return WrapCrossAlignment.end;
      case CrossAxisAlignment.center:
        return WrapCrossAlignment.center;
      case CrossAxisAlignment.stretch:
        return WrapCrossAlignment.start;
      case CrossAxisAlignment.baseline:
        return WrapCrossAlignment.start; // Default to start
    }
  }
}
