import 'package:flutter/material.dart';
import 'package:lmima_food/features/presentation/widgets/common/custom_button.dart';
import 'package:lmima_food/features/presentation/widgets/common/custom_text.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_paths.dart';
import '../../../../../core/enums/app_enums.dart';
import '../../../../../core/util/responsive_screen_adapter.dart';
import '../../../../../core/util/responsive_size_adapter.dart';
import '../../../widgets/common/field.dart';
import '../../../widgets/features/dish_item_card.dart';

class CategoriesProductsComponent extends StatefulWidget {
  const CategoriesProductsComponent({super.key});

  @override
  State<CategoriesProductsComponent> createState() =>
      _CategoriesProductsComponentState();
}

class _CategoriesProductsComponentState
    extends State<CategoriesProductsComponent> {
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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        padding: EdgeInsets.symmetric(horizontal: R.size(250)),
        gap: R.size(20),
        children: [
          CustomText(
            text: 'Dishes Categories',
            fontSize: R.size(38),
            fontWeight: FontWeight.w700,
            color: AppColors.light.primaryColor2,
          ),
          CustomField(
              arrangement: FieldArrangement.row,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              width: double.infinity,
              wrap: true,
              gap: R.size(20),
              children: [
                CustomButton(
                  text: 'Main Dishes',
                  textSize: R.size(16),
                  fontWeight: FontWeight.w500,
                  textColor: AppColors.light.primaryColor3,
                  backgroundColor: AppColors.light.primaryColor2,
                  padding: EdgeInsets.symmetric(
                      vertical: R.size(10), horizontal: R.size(30)),
                  borderRadius: R.size(30),
                ),
                CustomButton(
                  text: 'Appetizers and Salads',
                  textSize: R.size(16),
                  fontWeight: FontWeight.w500,
                  textColor: AppColors.light.primaryColor2,
                  backgroundColor:
                      AppColors.light.primaryColor2.withOpacity(.1),
                  padding: EdgeInsets.symmetric(
                      vertical: R.size(10), horizontal: R.size(30)),
                  borderRadius: R.size(30),
                ),
                CustomButton(
                  text: 'Soups',
                  textSize: R.size(16),
                  fontWeight: FontWeight.w500,
                  textColor: AppColors.light.primaryColor2,
                  backgroundColor:
                      AppColors.light.primaryColor2.withOpacity(.1),
                  padding: EdgeInsets.symmetric(
                      vertical: R.size(10), horizontal: R.size(30)),
                  borderRadius: R.size(30),
                ),
                CustomButton(
                  text: 'astries and Sweets',
                  textSize: R.size(16),
                  fontWeight: FontWeight.w500,
                  textColor: AppColors.light.primaryColor2,
                  backgroundColor:
                      AppColors.light.primaryColor2.withOpacity(.1),
                  padding: EdgeInsets.symmetric(
                      vertical: R.size(10), horizontal: R.size(30)),
                  borderRadius: R.size(30),
                ),
                CustomButton(
                  text: 'Pastries and Sweets',
                  textSize: R.size(16),
                  fontWeight: FontWeight.w500,
                  textColor: AppColors.light.primaryColor2,
                  backgroundColor:
                      AppColors.light.primaryColor2.withOpacity(.1),
                  padding: EdgeInsets.symmetric(
                      vertical: R.size(10), horizontal: R.size(30)),
                  borderRadius: R.size(30),
                ),
                CustomButton(
                  text: 'Beverages',
                  textSize: R.size(16),
                  fontWeight: FontWeight.w500,
                  textColor: AppColors.light.primaryColor2,
                  backgroundColor:
                      AppColors.light.primaryColor2.withOpacity(.1),
                  padding: EdgeInsets.symmetric(
                      vertical: R.size(10), horizontal: R.size(30)),
                  borderRadius: R.size(30),
                ),
              ]),
          CustomField(
            arrangement: FieldArrangement.row,
            flex: 1,
            crossAxisAlignment: CrossAxisAlignment.center,
            padding: EdgeInsets.symmetric(vertical: R.size(20)),
            wrap: true,
            gap: R.size(40),
            children: [
              DishItemCard(
                dishImagePath: AppPaths.images.sliderImage2,
                profileImagePath: AppPaths.images.profilePicture,
                title: 'Tagine de Poulet',
                price: 12.99,
                rating: 4,
              ),
              DishItemCard(
                dishImagePath: AppPaths.images.sliderImage2,
                profileImagePath: AppPaths.images.profilePicture,
                title: 'Tagine de Poulet',
                price: 12.99,
                rating: 4,
              ),
              DishItemCard(
                dishImagePath: AppPaths.images.sliderImage2,
                profileImagePath: AppPaths.images.profilePicture,
                title: 'Tagine de Poulet',
                price: 12.99,
                rating: 4,
              ),
              DishItemCard(
                dishImagePath: AppPaths.images.sliderImage2,
                profileImagePath: AppPaths.images.profilePicture,
                title: 'Tagine de Poulet',
                price: 12.99,
                rating: 4,
              ),
              DishItemCard(
                dishImagePath: AppPaths.images.sliderImage2,
                profileImagePath: AppPaths.images.profilePicture,
                title: 'Tagine de Poulet',
                price: 12.99,
                rating: 4,
              ),
              DishItemCard(
                dishImagePath: AppPaths.images.sliderImage2,
                profileImagePath: AppPaths.images.profilePicture,
                title: 'Tagine de Poulet',
                price: 12.99,
                rating: 4,
              ),
              DishItemCard(
                dishImagePath: AppPaths.images.sliderImage2,
                profileImagePath: AppPaths.images.profilePicture,
                title: 'Tagine de Poulet',
                price: 12.99,
                rating: 4,
              )
            ],
          )
        ]);
  }
}
