import 'package:flutter/material.dart';

import '../../../config/theme/app_themes.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/util/responsive_screen_adapter.dart';
import '../../../core/util/responsive_size_adapter.dart';

class CustomTextField extends StatelessWidget {
  final double? width;
  final double? fontSize;
  final String? hint;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final Function(String value)? onChanged;

  const CustomTextField({
    super.key,
    this.width,
    this.fontSize,
    this.hint,
    this.borderColor,
    this.focusedBorderColor,
    this.keyboardType,
    this.obscureText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ResponsiveScreenAdapter(
        defaultScreen: _buildDialogMobile(context),
        screenMobile: _buildDialogMobile(context),
      ),
    );
  }

  Widget _buildDialogMobile(BuildContext context) {
    final ResponsiveSizeAdapter R = ResponsiveSizeAdapter(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (hint != null)
          Text(
            hint!,
            style:
                AppThemes.bodyText.copyWith(fontSize: fontSize ?? R.size(25)),
          ),
        SizedBox(
          height: R.size(12),
        ),
        TextField(
          style: TextStyle(fontSize: fontSize ?? R.size(30)),
          obscureText: obscureText ?? false,
          keyboardType: keyboardType,
          onChanged: onChanged,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                horizontal: R.size(30), vertical: R.size(10)),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: borderColor ?? AppColors.grayArsenic.withOpacity(.6),
                width: R.size(2),
              ),
              borderRadius: BorderRadius.circular(0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: focusedBorderColor ?? AppColors.greenBianchi,
                width: R.size(3),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
