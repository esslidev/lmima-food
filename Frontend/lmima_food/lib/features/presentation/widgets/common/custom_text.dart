import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
  final double? letterSpacing;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final int? maxLines;
  final TextOverflow? overflow;
  final double? lineHeight; // Add line height property

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
    this.letterSpacing,
    this.padding,
    this.margin,
    this.maxLines,
    this.overflow,
    this.lineHeight, // Initialize line height property
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (svgIconPath != null && svgIconPath!.isNotEmpty)
            SvgPicture.asset(
              svgIconPath!,
              color: iconColor,
              width: iconWidth,
              height: iconHeight,
            ),
          if (svgIconPath != null && svgIconPath!.isNotEmpty)
            SizedBox(
              width: iconTextPadding ?? ResponsiveSizeAdapter(context).size(8),
            ),
          Text(
            text,
            softWrap: true,
            style: (style ?? AppThemes.bodyText).copyWith(
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              letterSpacing: letterSpacing,
              height: lineHeight, // Set line height here
            ),
            textAlign: textAlign,
            maxLines: maxLines,
            overflow: overflow,
          ),
        ],
      ),
    );
  }
}
