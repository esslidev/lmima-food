import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/enums/app_enums.dart';
import '../../../../core/resources/custom_dropdown_menu_item.dart';
import '../../../../core/resources/drop_down_style.dart';
import '../../../../core/util/responsive_size_adapter.dart';

class CustomTextField extends StatefulWidget {
  final double? width;
  final double? height;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final double? borderRadius;
  final String? svgIconPath;
  final double? iconWidth;
  final double? iconHeight;
  final CustomTextFieldIconPosition iconPosition;
  final Color? iconColor;
  final String? hintText;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final Color? borderColor;
  final List<CustomDropdownMenuItem>? dropdownItems;
  final DropdownStyle? dropdownStyle;

  const CustomTextField({
    super.key,
    this.width,
    this.height,
    this.margin = const EdgeInsets.all(0.0),
    this.padding = const EdgeInsets.all(0.0),
    this.borderRadius,
    this.svgIconPath,
    this.iconWidth,
    this.iconHeight,
    this.iconPosition = CustomTextFieldIconPosition.end,
    this.iconColor,
    this.hintText,
    this.hintStyle,
    this.textStyle,
    this.backgroundColor,
    this.borderColor,
    this.dropdownItems,
    this.dropdownStyle,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late ResponsiveSizeAdapter R;

  final TextEditingController _controller = TextEditingController();
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();

  bool _isDropdownVisible = false;

  @override
  void initState() {
    super.initState();
    R = ResponsiveSizeAdapter(context);

    // Add a listener to the controller to detect changes in text
    _controller.addListener(() {
      if (_controller.text.isNotEmpty) {
        _showDropdown();
      } else {
        _hideDropdown();
      }
    });
  }

  @override
  void dispose() {
    _overlayEntry?.remove();
    _controller.dispose();
    super.dispose();
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
      setState(() {
        _isDropdownVisible = true;
      });
    }
  }

  void _hideDropdown() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    setState(() {
      _isDropdownVisible = false;
    });
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
                widget.dropdownStyle?.borderRadius ?? const Radius.circular(6)),
            color: widget.dropdownStyle?.backgroundColor,
            child: Column(
              children: widget.dropdownItems?.map((item) {
                    return GestureDetector(
                      onTap: () {
                        _hideDropdown();
                        if (item.onTap != null) {
                          item.onTap!();
                        }
                      },
                      child: item.child,
                    );
                  }).toList() ??
                  [],
            ),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: IntrinsicWidth(
        child: Container(
          width: widget.width,
          height: widget.height,
          margin: widget.margin,
          padding: widget.padding,
          decoration: BoxDecoration(
            color: widget.backgroundColor ?? Colors.white,
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 6),
            border: Border.all(color: widget.borderColor ?? Colors.grey),
          ),
          child: Row(
            children: [
              if (widget.svgIconPath != null &&
                  widget.iconPosition == CustomTextFieldIconPosition.start)
                Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: SvgPicture.asset(
                    widget.svgIconPath!,
                    color: widget.iconColor,
                    width: widget.iconWidth,
                    height: widget.iconHeight,
                  ),
                ),
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: widget.hintText,
                    hintStyle: widget.hintStyle,
                    border: InputBorder.none,
                  ),
                  style: widget.textStyle,
                ),
              ),
              if (widget.svgIconPath != null &&
                  widget.iconPosition == CustomTextFieldIconPosition.end)
                Padding(
                  padding: const EdgeInsets.only(left: 0.0),
                  child: SvgPicture.asset(
                    widget.svgIconPath!,
                    color: widget.iconColor,
                    width: widget.iconWidth,
                    height: widget.iconHeight,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
