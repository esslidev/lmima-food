import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/enums/app_enums.dart';
import '../../../../core/util/responsive_size_adapter.dart';
import '../common/custom_text.dart';
import '../common/field.dart';

class AboutUsItemCard extends StatelessWidget {
  final String svgIconPath;
  final String title;
  final String paragraph;
  final Color? foregroundColor;
  final Color? backgroundColor;

  const AboutUsItemCard({
    super.key,
    required this.svgIconPath,
    required this.title,
    required this.paragraph,
    this.foregroundColor,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    ResponsiveSizeAdapter R = ResponsiveSizeAdapter(context);

    return CustomField(
      backgroundColor: backgroundColor ?? AppColors.light.primaryColor1,
      arrangement: FieldArrangement.row,
      borderColor: AppColors.light.primaryColor2.withOpacity(.2),
      borderRadius: R.size(10),
      crossAxisAlignment: CrossAxisAlignment.center,
      gap: R.size(20),
      padding:
          EdgeInsets.symmetric(vertical: R.size(20), horizontal: R.size(15)),
      children: [
        Container(
          width: R.size(50),
          height: R.size(50),
          decoration: BoxDecoration(
            color: AppColors.light.primaryColor3,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: SvgPicture.asset(
              svgIconPath,
              width: R.size(30),
              height: R.size(30),
              color: AppColors.light.primaryColor2,
            ),
          ),
        ),
        CustomField(
            arrangement: FieldArrangement.column,
            gap: R.size(6),
            children: [
              CustomText(
                text: title,
                fontSize: R.size(18),
                fontWeight: FontWeight.w600,
                color: foregroundColor ?? AppColors.light.primaryColor2,
              ),
              CustomText(
                text: paragraph,
                fontSize: R.size(13),
                fontWeight: FontWeight.w400,
                color: foregroundColor ?? AppColors.light.primaryColor2,
              ),
            ])
      ],
    );
  }
}
