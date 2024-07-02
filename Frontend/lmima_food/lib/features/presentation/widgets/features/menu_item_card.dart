import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_paths.dart';
import '../../../../core/enums/app_enums.dart';
import '../../../../core/util/responsive_size_adapter.dart';
import '../common/custom_button.dart';
import '../common/custom_text.dart';
import '../common/field.dart';
import 'rating_stars_field.dart'; // Replace with your actual import paths

class MenuItemCard extends StatelessWidget {
  final String dishesImagePath;
  final String profileImagePath;
  final String title;
  final List<String> flavors;
  final int rating;

  const MenuItemCard({
    super.key,
    required this.dishesImagePath,
    required this.profileImagePath,
    required this.title,
    required this.flavors,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    ResponsiveSizeAdapter R = ResponsiveSizeAdapter(context);

    return IntrinsicWidth(
      child: CustomField(
        arrangement: FieldArrangement.column,
        borderWidth: R.size(1),
        borderColor: AppColors.light.primaryColor2.withOpacity(.2),
        borderRadius: R.size(10),
        crossAxisAlignment: CrossAxisAlignment.center,
        gap: R.size(10),
        padding:
            EdgeInsets.symmetric(vertical: R.size(30), horizontal: R.size(20)),
        children: [
          Image.asset(
            dishesImagePath,
            width: R.size(260),
          ),
          CustomField(
            arrangement: FieldArrangement.row,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(R.size(20)),
                child: Image.asset(
                  profileImagePath,
                  width: R.size(50),
                  height: R.size(50),
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          CustomField(
            arrangement: FieldArrangement.row,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomButton(
                text: 'Hispanic', // Example text, replace with actual data
                fontWeight: FontWeight.w400,
                textSize: R.size(14),
                padding: EdgeInsets.symmetric(
                    vertical: R.size(4), horizontal: R.size(8)),
                borderRadius: R.size(6),
                backgroundColor: AppColors.light.primaryColor1,
              ),
              RatingStarsField(
                starsSize: R.size(14),
                rate: rating, // Example rating, replace with actual data
              )
            ],
          ),
          Divider(
            color: AppColors.light.primaryColor2.withOpacity(.2),
            thickness: R.size(1),
            indent: R.size(6),
            endIndent: R.size(6),
          ),
          CustomField(
            arrangement: FieldArrangement.column,
            children: [
              CustomText(
                text: title,
                fontSize: R.size(16),
                fontWeight: FontWeight.w500,
              ),
              ...flavors.map((flavor) => CustomText(text: '• $flavor')),
            ],
          ),
          Divider(
            color: AppColors.light.primaryColor2.withOpacity(.2),
            thickness: R.size(1),
            indent: R.size(6),
            endIndent: R.size(6),
          ),
          CustomButton(
            svgIconPath: AppPaths.vectors.longArrowRightIcon,
            iconTextPadding: R.size(10),
            iconHeight: R.size(14),
            iconColor: AppColors.whiteSolid,
            backgroundColor: AppColors.light.primaryColor1,
            borderRadius: R.size(30),
            padding: EdgeInsets.symmetric(
                vertical: R.size(10), horizontal: R.size(40)),
            iconPosition: CustomButtonIconPosition.right,
            text: 'Discover now',
            textSize: R.size(14),
            textColor: AppColors.whiteSolid,
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
    );
  }
}
