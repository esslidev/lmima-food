import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_paths.dart';
import '../../../../core/enums/app_enums.dart';
import '../../../../core/util/responsive_size_adapter.dart';
import '../common/custom_button.dart';
import '../common/custom_text.dart';
import '../common/field.dart';
import 'rating_stars_field.dart'; // Replace with your actual import paths

class DishItemCard extends StatelessWidget {
  final String dishImagePath;
  final String profileImagePath;
  final String title;
  final double price;
  final int rating;

  const DishItemCard({
    super.key,
    required this.dishImagePath,
    required this.profileImagePath,
    required this.title,
    required this.price,
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
            dishImagePath,
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
            arrangement: FieldArrangement.column,
            crossAxisAlignment: CrossAxisAlignment.start,
            gap: R.size(6),
            children: [
              CustomText(
                text: title,
                fontSize: R.size(16),
                fontWeight: FontWeight.w500,
              ),
              RatingStarsField(
                starsSize: R.size(14),
                rate: rating,
              ),
            ],
          ),
          Divider(
            color: AppColors.light.primaryColor2.withOpacity(.2),
            thickness: R.size(1),
            indent: R.size(6),
            endIndent: R.size(6),
          ),
          CustomField(
            arrangement: FieldArrangement.row,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomText(
                text: '\$${price.toStringAsFixed(2)}',
                fontSize: R.size(16),
                fontWeight: FontWeight.bold,
                color: AppColors.light.primaryColor2,
              ),
              CustomButton(
                text: 'Add to Cart',
                svgIconPath: AppPaths.vectors.cartIcon,
                iconHeight: R.size(16),
                iconColor: AppColors.light.primaryColor3,
                fontWeight: FontWeight.w400,
                textSize: R.size(14),
                padding: EdgeInsets.symmetric(
                    vertical: R.size(8), horizontal: R.size(16)),
                borderRadius: R.size(30),
                backgroundColor: AppColors.light.primaryColor2,
                textColor: AppColors.whiteSolid,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
