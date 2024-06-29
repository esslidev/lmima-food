import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomButton1Style {
  final double? width;
  final double? height;
  final Color? iconColor;
  final Color? backgroundColor;
  final Color? textColor;
  final List<BoxShadow>? boxShadow;

  CustomButton1Style({
    this.width,
    this.height,
    this.iconColor,
    this.backgroundColor,
    this.textColor,
    this.boxShadow,
  });
}

class CustomButton1 extends StatefulWidget {
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
  final CustomButton1Style? onActiveStyle;
  final VoidCallback? onPressed;
  final List<Widget>? dropdownItems;
  final DropdownAlignment dropdownAlignment;

  const CustomButton1({
    super.key,
    this.width,
    this.height,
    this.margin = const EdgeInsets.all(0.0),
    this.padding = const EdgeInsets.all(0.0),
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
    this.onPressed,
    this.dropdownItems,
    this.dropdownAlignment = DropdownAlignment.end,
  });

  @override
  State<CustomButton1> createState() => _CustomButtonState();
}

enum DropdownAlignment { start, middle, end }

class _CustomButtonState extends State<CustomButton1> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  bool _isDropdownVisible = false;

  void _toggleDropdown() {
    if (_isDropdownVisible) {
      _hideDropdown();
    } else {
      _showDropdown();
    }
  }

  void _showDropdown() {
    final overlay = Overlay.of(context);
    if (_overlayEntry == null) {
      _overlayEntry = _createOverlayEntry();
      overlay.insert(_overlayEntry!);
      _isDropdownVisible = true;
    }
  }

  void _hideDropdown() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    _isDropdownVisible = false;
  }

  OverlayEntry _createOverlayEntry() {
    return OverlayEntry(
      builder: (context) {
        final double offset;
        switch (widget.dropdownAlignment) {
          case DropdownAlignment.start:
            offset = 0;
            break;
          case DropdownAlignment.middle:
            offset = (widget.width ?? 0) / 2;
            break;
          case DropdownAlignment.end:
          default:
            offset = widget.width ?? 0;
            break;
        }

        return Positioned(
          width: widget.width,
          child: CompositedTransformFollower(
            link: _layerLink,
            showWhenUnlinked: false,
            offset: Offset(offset, widget.height ?? 0),
            child: Material(
              elevation: 4,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(widget.borderRadius ?? 0.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: widget.dropdownItems?.map((item) {
                        return GestureDetector(
                          onTap: () {
                            _hideDropdown();
                            if (item is DropdownMenuItem) {
                              item.onTap?.call();
                            }
                          },
                          child: item,
                        );
                      }).toList() ??
                      [],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: GestureDetector(
        onTap: _toggleDropdown,
        child: Container(
          margin: widget.margin,
          width: widget.width,
          height: widget.height,
          padding: widget.padding,
          decoration: BoxDecoration(
            color: widget.isActive
                ? widget.onActiveStyle?.backgroundColor
                : widget.backgroundColor,
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 0.0),
            boxShadow: widget.isActive
                ? widget.onActiveStyle?.boxShadow
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
                      : widget.iconColor,
                  width: widget.iconWidth,
                  height: widget.iconHeight,
                ),
              if (widget.svgIconPath != null)
                SizedBox(width: widget.iconTextPadding ?? 8),
              if (widget.text != null)
                Text(
                  widget.text!,
                  style: TextStyle(
                    color: widget.isActive
                        ? widget.onActiveStyle?.textColor
                        : widget.textColor,
                    fontSize: widget.textSize,
                    fontWeight: widget.fontWeight ?? FontWeight.w400,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _overlayEntry?.remove();
    super.dispose();
  }
}
