import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../config/theme/app_themes.dart';
import '../../../../core/util/responsive_size_adapter.dart';

class CustomText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final String? svgIconPath;
  final double? iconWidth;
  final double? iconHeight;
  final Color? iconColor;
  final double? iconTextPadding;
  final double? letterSpacing; // Added letterSpacing property
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final int? maxLines;
  final TextOverflow? overflow;

  const CustomText({
    super.key,
    required this.text,
    this.style,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.textAlign,
    this.svgIconPath,
    this.iconWidth,
    this.iconHeight,
    this.iconColor,
    this.iconTextPadding,
    this.letterSpacing, // Added letterSpacing parameter
    this.padding,
    this.margin,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (svgIconPath != null)
            SvgPicture.asset(
              svgIconPath!,
              color: iconColor,
              width: iconWidth,
              height: iconHeight,
            ),
          if (svgIconPath != null)
            SizedBox(
                width:
                    iconTextPadding ?? ResponsiveSizeAdapter(context).size(8)),
          Expanded(
            child: Text(
              text,
              style: style?.copyWith(
                    color: color,
                    fontSize: fontSize,
                    fontWeight: fontWeight,
                    letterSpacing: letterSpacing, // Applying letterSpacing here
                  ) ??
                  AppThemes.bodyText.copyWith(
                    color: color,
                    fontSize: fontSize,
                    fontWeight: fontWeight,
                    letterSpacing: letterSpacing, // Applying letterSpacing here
                  ),
              textAlign: textAlign,
              maxLines: maxLines,
              overflow: overflow,
            ),
          ),
        ],
      ),
    );
  }
}
