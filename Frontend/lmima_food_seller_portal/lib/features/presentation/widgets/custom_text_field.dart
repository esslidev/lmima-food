import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/util/responsive_size_adapter.dart';

class CustomTextField extends StatefulWidget {
  final Color? backgroundColor;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? borderRadius;
  final double borderWidth;
  final Color? borderColor;
  final String? hintText;
  final String? svgIconPath;
  final double? iconWidth;
  final double? iconHeight;
  final Color? iconColor;
  final VoidCallback? onIconPressed;
  final List<Widget>? dropdownItems;
  final bool showDropdown;
  final EdgeInsets? dropdownMargin;
  final EdgeInsets? dropdownPadding;

  const CustomTextField({
    super.key,
    this.backgroundColor,
    this.padding,
    this.margin,
    this.borderRadius,
    this.borderWidth = 1.0,
    this.borderColor,
    this.hintText,
    this.svgIconPath,
    this.iconWidth,
    this.iconHeight,
    this.iconColor,
    this.onIconPressed,
    this.dropdownItems,
    this.showDropdown = false,
    this.dropdownMargin,
    this.dropdownPadding,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late ResponsiveSizeAdapter R;

  @override
  Widget build(BuildContext context) {
    R = ResponsiveSizeAdapter(context);

    return Column(
      children: [
        Container(
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
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: widget.hintText,
                    border: InputBorder.none,
                  ),
                ),
              ),
              if (widget.svgIconPath != null)
                IconButton(
                  icon: SvgPicture.asset(
                    widget.svgIconPath!,
                    width: widget.iconWidth ?? 24.0,
                    height: widget.iconHeight ?? 24.0,
                    color: widget.iconColor,
                  ),
                  onPressed: widget.onIconPressed,
                ),
            ],
          ),
        ),
        if (widget.showDropdown && widget.dropdownItems != null)
          Container(
            margin: widget.dropdownMargin ?? EdgeInsets.only(top: R.size(8)),
            padding: widget.dropdownPadding ?? EdgeInsets.all(R.size(8)),
            decoration: BoxDecoration(
              color: widget.backgroundColor,
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 0.0),
              border: Border.all(
                color: widget.borderColor ?? Colors.black,
                width: widget.borderWidth,
              ),
            ),
            child: Column(
              children: widget.dropdownItems!,
            ),
          ),
      ],
    );
  }
}
