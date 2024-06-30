import 'package:flutter/material.dart';
import 'package:lmima_food/core/constants/app_paths.dart';
import 'package:lmima_food/features/presentation/widgets/common/custom_button.dart';

import '../../../../../core/enums/app_enums.dart';
import '../../../../../core/util/responsive_screen_adapter.dart';
import '../../../../../core/util/responsive_size_adapter.dart';
import '../../../widgets/common/field.dart';

class HeaderComponent extends StatefulWidget {
  const HeaderComponent({super.key});

  @override
  State<HeaderComponent> createState() => _HeaderComponentState();
}

class _HeaderComponentState extends State<HeaderComponent> {
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
        height: R.size(100),
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        padding: EdgeInsets.symmetric(horizontal: R.size(200)),
        children: [
          Image.asset(
            AppPaths.images.logo,
            height: R.size(70),
          ),
          CustomField(
              arrangement: FieldArrangement.row,
              crossAxisAlignment: CrossAxisAlignment.center,
              gap: R.size(30),
              children: [
                CustomButton(
                  svgIconPath: AppPaths.vectors.profileIcon,
                  iconHeight: R.size(20),
                  iconPosition: IconPosition.top,
                  text: 'Profile',
                  textSize: R.size(13),
                  fontWeight: FontWeight.w400,
                ),
                CustomButton(
                  svgIconPath: AppPaths.vectors.wishlistIcon,
                  iconHeight: R.size(20),
                  iconPosition: IconPosition.top,
                  text: 'Wishlist',
                  textSize: R.size(13),
                ),
                CustomButton(
                  svgIconPath: AppPaths.vectors.cartIcon,
                  iconHeight: R.size(20),
                  iconPosition: IconPosition.top,
                  text: 'My Cart',
                  textSize: R.size(13),
                ),
              ]),
        ]);
  }
}
