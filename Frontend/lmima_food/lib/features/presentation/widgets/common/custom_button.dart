import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lmima_food/features/presentation/widgets/common/field.dart';

import '../../../../core/enums/app_enums.dart';
import '../../../../core/util/responsive_size_adapter.dart';

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
  final VoidCallback? onPressed;
  final List<Widget>? dropdownItems;
  final DropdownStyle? dropdownStyle;

  const CustomButton({
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
    this.onHoverStyle,
    this.onPressed,
    this.dropdownItems,
    this.dropdownStyle,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  late ResponsiveSizeAdapter R;

  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();

  bool _isHovered = false;
  bool _isDropdownVisible = false;

  void _onHover(bool isHovered) {
    setState(() {
      _isHovered = widget.onHoverStyle != null ? isHovered : false;
    });
  }

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
    return OverlayEntry(builder: (context) {
      final double xOffset;
      switch (widget.dropdownStyle?.dropdownAlignment) {
        case DropdownAlignment.start:
          xOffset = 0;
          break;
        case DropdownAlignment.center:
          xOffset = -((widget.width ?? R.size(200)) / 2);
          break;
        case DropdownAlignment.end:
        default:
          xOffset = -(widget.width ?? R.size(200));
          break;
      }

      return Positioned(
        width: widget.dropdownStyle?.width ?? R.size(200),
        height: widget.dropdownStyle?.height,
        child: CompositedTransformFollower(
            link: _layerLink,
            showWhenUnlinked: false,
            offset: Offset(xOffset, (widget.height ?? 0) + 10),
            child: Material(
              elevation: widget.dropdownStyle?.elevation ?? 3,
              borderRadius: BorderRadius.all(
                  widget.dropdownStyle?.borderRadius ??
                      const Radius.circular(6)),
              color: widget.dropdownStyle?.backgroundColor,
              child: CustomField(
                arrangement: FieldArrangement.column,
                padding:
                    widget.dropdownStyle?.padding ?? EdgeInsets.all(R.size(20)),
                mainAxisAlignment: widget.dropdownStyle?.mainAxisAlignment ??
                    MainAxisAlignment.center,
                crossAxisAlignment: widget.dropdownStyle?.crossAxisAlignment ??
                    CrossAxisAlignment.center,
                children: widget.dropdownItems ?? [],
              ),
            )),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    R = ResponsiveSizeAdapter(context);
  }

  @override
  void dispose() {
    _overlayEntry?.remove();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: MouseRegion(
        onEnter: (_) => _onHover(true),
        onExit: (_) => _onHover(false),
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
      ),
    );
  }
}
