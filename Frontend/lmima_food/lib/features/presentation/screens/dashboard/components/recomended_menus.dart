import 'package:flutter/material.dart';
import 'package:lmima_food/features/presentation/widgets/common/custom_text.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_paths.dart';
import '../../../../../core/enums/app_enums.dart';
import '../../../../../core/util/responsive_screen_adapter.dart';
import '../../../../../core/util/responsive_size_adapter.dart';
import '../../../widgets/common/field.dart';
import '../../../widgets/features/menu_item_card.dart';

class RecomendedMenusComponent extends StatefulWidget {
  const RecomendedMenusComponent({super.key});

  @override
  State<RecomendedMenusComponent> createState() =>
      _RecomendedMenusComponentState();
}

class _RecomendedMenusComponentState extends State<RecomendedMenusComponent> {
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
          CustomText(
            text: 'Recomended menus',
            fontSize: R.size(38),
            fontWeight: FontWeight.w700,
            color: AppColors.light.primaryColor2,
          ),
          CustomField(
            arrangement: FieldArrangement.row,
            flex: 1,
            wrap: true,
            gap: R.size(40),
            crossAxisAlignment: CrossAxisAlignment.center,
            padding: EdgeInsets.symmetric(vertical: R.size(20)),
            children: [
              MenuItemCard(
                dishesImagePath: AppPaths.images.sliderImage1,
                profileImagePath: AppPaths.images.profilePicture,
                title: 'Flavors of Morocco',
                flavors: const [
                  'Tagine de Poulet',
                  'Harira',
                  'Pastilla au Poulet',
                ],
                rating: 3,
              ),
              MenuItemCard(
                dishesImagePath: AppPaths.images.sliderImage1,
                profileImagePath: AppPaths.images.profilePicture,
                title: 'Flavors of Morocco',
                flavors: const [
                  'Tagine de Poulet',
                  'Harira',
                  'Pastilla au Poulet',
                ],
                rating: 3,
              ),
              MenuItemCard(
                dishesImagePath: AppPaths.images.sliderImage1,
                profileImagePath: AppPaths.images.profilePicture,
                title: 'Flavors of Morocco',
                flavors: const [
                  'Tagine de Poulet',
                  'Harira',
                  'Pastilla au Poulet',
                ],
                rating: 3,
              ),
              MenuItemCard(
                dishesImagePath: AppPaths.images.sliderImage1,
                profileImagePath: AppPaths.images.profilePicture,
                title: 'Flavors of Morocco',
                flavors: const [
                  'Tagine de Poulet',
                  'Harira',
                  'Pastilla au Poulet',
                ],
                rating: 3,
              ),
            ],
          )
        ]);
  }
}
