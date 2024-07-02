import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lmima_food/core/constants/app_paths.dart';
import 'package:lmima_food/features/presentation/widgets/common/custom_text.dart';
import 'package:lmima_food/features/presentation/widgets/features/about_us_item_card.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/enums/app_enums.dart';
import '../../../../../core/util/responsive_screen_adapter.dart';
import '../../../../../core/util/responsive_size_adapter.dart';
import '../../../widgets/common/field.dart';

class AboutUsComponent extends StatefulWidget {
  const AboutUsComponent({super.key});

  @override
  State<AboutUsComponent> createState() => _AboutUsComponentState();
}

class _AboutUsComponentState extends State<AboutUsComponent> {
  late ResponsiveSizeAdapter R;

  @override
  void initState() {
    super.initState();
    R = ResponsiveSizeAdapter(context);
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveScreenAdapter(
      defaultScreen: _buildDesktop(context),
      screenDesktop: _buildDesktop(context),
    );
  }

  Widget _buildDesktop(BuildContext context) {
    return CustomField(
        arrangement: FieldArrangement.column,
        width: double.infinity,
        margin: EdgeInsets.only(top: R.size(40), bottom: R.size(20)),
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        padding: EdgeInsets.symmetric(horizontal: R.size(250)),
        gap: R.size(20),
        children: [
          IntrinsicWidth(
            child: CustomText(
              text: 'All Abous Us',
              fontSize: R.size(38),
              fontWeight: FontWeight.w700,
              color: AppColors.light.primaryColor2,
            ),
          ),
          CustomField(
            arrangement: FieldArrangement.row,
            flex: 1,
            gap: R.size(40),
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            padding: EdgeInsets.symmetric(vertical: R.size(20)),
            children: [
              AboutUsItemCard(
                  svgIconPath: AppPaths.vectors.ratingStarIcon,
                  title: 'Fast Delivery',
                  backgroundColor: AppColors.light.primaryColor1,
                  foregroundColor: AppColors.light.primaryColor3,
                  paragraph:
                      'The Customer Pays An Extra Shipping Cost \nFor This Type Of Delivery, As The Shipment Will \nGet Transported To Him Anywhere Between 24 \nTo 72 Hours.'),
              AboutUsItemCard(
                  svgIconPath: AppPaths.vectors.ratingStarIcon,
                  backgroundColor: AppColors.light.primaryColor2,
                  foregroundColor: AppColors.light.primaryColor3,
                  title: '24/7 Free Support',
                  paragraph:
                      'The Customer Pays An Extra Shipping Cost For \nThis Type Of Delivery, As The Shipment Will \nGet Transported To Him Anywhere Between 24 \nTo 72 Hours.'),
              AboutUsItemCard(
                  svgIconPath: AppPaths.vectors.ratingStarIcon,
                  title: 'Our Mission',
                  backgroundColor: AppColors.light.primaryColor1,
                  foregroundColor: AppColors.light.primaryColor3,
                  paragraph:
                      'To provide the best services and products to \nour customers, ensuring satisfaction and continuous \nimprovement.')
            ],
          )
        ]);
  }
}
