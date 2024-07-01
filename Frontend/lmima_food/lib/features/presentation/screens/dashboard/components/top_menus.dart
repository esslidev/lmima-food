import 'package:flutter/material.dart';
import 'package:lmima_food/core/constants/app_colors.dart';
import 'package:lmima_food/core/constants/app_paths.dart';
import 'package:lmima_food/features/presentation/widgets/common/custom_text.dart';

import '../../../../../core/enums/app_enums.dart';
import '../../../../../core/util/responsive_screen_adapter.dart';
import '../../../../../core/util/responsive_size_adapter.dart';
import '../../../widgets/common/custom_button.dart';
import '../../../widgets/common/field.dart';

class TopMenusComponent extends StatefulWidget {
  const TopMenusComponent({super.key});

  @override
  State<TopMenusComponent> createState() => _TopMenusComponentState();
}

class _TopMenusComponentState extends State<TopMenusComponent> {
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
            text: 'Top menus',
            fontSize: R.size(40),
            fontWeight: FontWeight.w500,
            color: AppColors.light.primaryColor2,
          ),
          CustomField(
            arrangement: FieldArrangement.row,
            flex: 1,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            padding: EdgeInsets.symmetric(vertical: R.size(20)),
            children: [
              CustomField(
                  arrangement: FieldArrangement.column,
                  borderWidth: R.size(1),
                  borderColor: AppColors.light.primaryColor2.withOpacity(.2),
                  borderRadius: R.size(10),
                  gap: R.size(10),
                  padding: EdgeInsets.symmetric(
                      vertical: R.size(30), horizontal: R.size(20)),
                  children: [
                    Image.asset(
                      AppPaths.images.sliderImage1,
                      width: R.size(260),
                    ),
                    CustomField(arrangement: FieldArrangement.row, children: [
                      Image.asset(
                        AppPaths.images.sliderImage1,
                        width: R.size(50),
                      ),
                    ]),
                    CustomField(
                        arrangement: FieldArrangement.row,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomButton(text: 'Hispanic'),
                          CustomField(
                              arrangement: FieldArrangement.row, children: [])
                        ])
                  ])
            ],
          )
        ]);
  }
}
