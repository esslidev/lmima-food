import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_paths.dart';
import '../../../../../core/enums/app_enums.dart';
import '../../../../../core/util/responsive_screen_adapter.dart';
import '../../../../../core/util/responsive_size_adapter.dart';
import '../../../widgets/common/custom_button.dart';
import '../../../widgets/common/field.dart';

class NavigationBarComponent extends StatefulWidget {
  const NavigationBarComponent({super.key});

  @override
  State<NavigationBarComponent> createState() => _NavigationBarComponentState();
}

class _NavigationBarComponentState extends State<NavigationBarComponent> {
  late ResponsiveSizeAdapter R;

  @override
  Widget build(BuildContext context) {
    R = ResponsiveSizeAdapter(context);

    return ResponsiveScreenAdapter(
      defaultScreen: _buildDesktop(context),
      screenDesktop: _buildDesktop(context),
    );
  }

  Widget _buildDesktop(BuildContext context) {
    return CustomField(
        arrangement: FieldArrangement.row,
        width: double.infinity,
        height: R.size(60),
        mainAxisAlignment: MainAxisAlignment.start,
        gap: R.size(40),
        crossAxisAlignment: CrossAxisAlignment.center,
        padding: EdgeInsets.symmetric(horizontal: R.size(200)),
        children: [
          CustomButton(
            svgIconPath: AppPaths.vectors.homeIcon,
            iconHeight: R.size(20),
            iconColor: AppColors.whiteSolid,
            backgroundColor: AppColors.greenBianchi,
            borderRadius: R.size(20),
            padding: EdgeInsets.symmetric(
                vertical: R.size(10), horizontal: R.size(30)),
            iconPosition: CustomButtonIconPosition.left,
            text: 'Home',
            textSize: R.size(15),
            textColor: AppColors.whiteSolid,
            fontWeight: FontWeight.w400,
          ),
          CustomButton(
            iconPosition: CustomButtonIconPosition.left,
            text: 'Menus',
            textSize: R.size(15),
            fontWeight: FontWeight.w400,
          ),
          CustomButton(
            iconPosition: CustomButtonIconPosition.left,
            text: 'Dishes',
            textSize: R.size(15),
            fontWeight: FontWeight.w400,
          ),
          CustomButton(
            iconPosition: CustomButtonIconPosition.left,
            text: 'Blog',
            textSize: R.size(15),
            fontWeight: FontWeight.w400,
          ),
          CustomButton(
            iconPosition: CustomButtonIconPosition.left,
            text: 'Contact',
            textSize: R.size(15),
            fontWeight: FontWeight.w400,
          ),
        ]);
  }
}
