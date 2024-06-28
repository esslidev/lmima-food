import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import '../../../config/theme/app_themes.dart';
import '../../../core/util/responsive_size_adapter.dart';

class CustomButtonStyle {
  final double? width;
  final double? height;
  final Color? iconColor;
  final Color? backgroundColor;
  final Color? textColor;
  final List<BoxShadow>? boxShadow;

  CustomButtonStyle(
      {this.width,
      this.height,
      this.iconColor,
      this.backgroundColor,
      this.textColor,
      this.boxShadow});
}

class CustomButton extends StatefulWidget {
  final double? width;
  final double? height;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final double? borderRadius;
  final String? svgIconPath;
  final double? iconWidth;
  final double? iconHeight;
  final Color? iconColor;
  final double? iconTextPadding;
  final String? text;
  final double? textSize;
  final FontWeight? fontWeight;
  final Color? backgroundColor;
  final Color? textColor;
  final List<BoxShadow>? boxShadow;
  final bool isActive;
  final CustomButtonStyle? onActiveStyle;
  final CustomButtonStyle? onHoverStyle;
  final VoidCallback? onPressed; // Add onPress property

  const CustomButton({
    super.key,
    this.width,
    this.height,
    this.margin = const EdgeInsets.all(8.0),
    this.padding = const EdgeInsets.all(8.0),
    this.borderRadius,
    this.svgIconPath,
    this.iconWidth,
    this.iconHeight,
    this.iconColor,
    this.iconTextPadding,
    this.text,
    this.textSize,
    this.fontWeight,
    this.backgroundColor,
    this.textColor,
    this.boxShadow,
    this.isActive = false,
    this.onActiveStyle,
    this.onHoverStyle,
    this.onPressed,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  late ResponsiveSizeAdapter R;

  bool _isHovered = false;

  void _onHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }

  @override
  Widget build(BuildContext context) {
    R = ResponsiveSizeAdapter(context);

    return Container(
      margin: widget.margin,
      width: widget.width,
      height: widget.height,
      child: MouseRegion(
        onEnter: (_) => _onHover(true),
        onExit: (_) => _onHover(false),
        child: GestureDetector(
          onTap: widget.onPressed,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            padding: widget.padding,
            decoration: BoxDecoration(
              color: widget.isActive
                  ? widget.onActiveStyle?.backgroundColor
                  : _isHovered
                      ? widget.onHoverStyle?.backgroundColor
                      : widget.backgroundColor,
              borderRadius:
                  BorderRadius.circular(widget.borderRadius ?? R.size(0)),
              boxShadow: widget.isActive
                  ? widget.onActiveStyle?.boxShadow
                  : _isHovered
                      ? widget.onHoverStyle?.boxShadow
                      : widget.boxShadow,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (widget.svgIconPath != null)
                  SvgPicture.asset(
                    widget.svgIconPath!,
                    color: widget.isActive
                        ? widget.onActiveStyle?.iconColor
                        : _isHovered
                            ? widget.onHoverStyle?.iconColor
                            : widget.iconColor,
                    width: widget.iconWidth,
                    height: widget.iconHeight,
                  ),
                if (widget.svgIconPath != null)
                  SizedBox(width: widget.iconTextPadding ?? R.size(8)),
                if (widget.text != null)
                  Text(
                    widget.text!,
                    style: AppThemes.bodyText.copyWith(
                      color: widget.isActive
                          ? widget.onActiveStyle?.textColor
                          : _isHovered
                              ? widget.onHoverStyle?.textColor
                              : widget.textColor,
                      fontSize: widget.textSize,
                      fontWeight: widget.fontWeight ?? FontWeight.w400,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
