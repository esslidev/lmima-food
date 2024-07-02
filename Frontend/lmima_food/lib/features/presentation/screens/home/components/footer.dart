import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lmima_food/core/constants/app_colors.dart';
import 'package:lmima_food/features/presentation/widgets/common/custom_button.dart';
import 'package:lmima_food/features/presentation/widgets/common/custom_text.dart';

import '../../../../../core/constants/app_paths.dart';
import '../../../../../core/enums/app_enums.dart';
import '../../../../../core/util/responsive_screen_adapter.dart';
import '../../../../../core/util/responsive_size_adapter.dart';
import '../../../widgets/common/field.dart';

class FooterComponent extends StatefulWidget {
  const FooterComponent({super.key});

  @override
  State<FooterComponent> createState() => _HeaderComponentState();
}

class _HeaderComponentState extends State<FooterComponent> {
  late ResponsiveSizeAdapter R;

  @override
  void initState() {
    super.initState();
    R = ResponsiveSizeAdapter(context);
  }

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
        arrangement: FieldArrangement.column,
        width: double.infinity,
        backgroundColor: AppColors.light.primaryColor2,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        padding:
            EdgeInsets.symmetric(vertical: R.size(30), horizontal: R.size(200)),
        gap: R.size(40),
        children: [
          Image.asset(
            AppPaths.images.logo,
            color: AppColors.whiteSolid,
            height: R.size(70),
          ),
          IntrinsicWidth(
            child: CustomText(
              text: '"Enjoy homestyle cooking, minus the kitchen chaos!"',
              fontSize: R.size(24),
              fontWeight: FontWeight.w200,
              color: AppColors.whiteSolid,
            ),
          ),
          IntrinsicWidth(
            child: CustomField(
                arrangement: FieldArrangement.row,
                gap: R.size(20),
                children: [
                  CustomButton(
                    svgIconPath: AppPaths.vectors.facebookIcon,
                    iconColor: AppColors.light.primaryColor3,
                    iconWidth: R.size(32),
                  ),
                  CustomButton(
                    svgIconPath: AppPaths.vectors.twitterIcon,
                    iconColor: AppColors.light.primaryColor3,
                    iconWidth: R.size(32),
                  ),
                  CustomButton(
                    svgIconPath: AppPaths.vectors.instagramIcon,
                    iconColor: AppColors.light.primaryColor3,
                    iconWidth: R.size(32),
                  ),
                  CustomButton(
                    svgIconPath: AppPaths.vectors.youtubeIcon,
                    iconColor: AppColors.light.primaryColor3,
                    iconWidth: R.size(32),
                  )
                ]),
          )
        ]);
  }
}
