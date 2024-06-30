import 'package:flutter/material.dart';
import 'package:lmima_food/core/enums/app_enums.dart';
import 'package:lmima_food/features/presentation/widgets/common/custom_text.dart';
import 'package:lmima_food/features/presentation/widgets/common/field.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/resources/custom_dropdown_menu_item.dart';
import '../../../../../core/util/responsive_screen_adapter.dart';
import '../../../../../core/util/responsive_size_adapter.dart';
import '../../../widgets/common/custom_button.dart';

class HeaderTapeComponent extends StatefulWidget {
  const HeaderTapeComponent({super.key});

  @override
  State<HeaderTapeComponent> createState() => _HeaderTapeComponentState();
}

class _HeaderTapeComponentState extends State<HeaderTapeComponent> {
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
        height: R.size(40),
        backgroundColor: AppColors.light.primaryColor1,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        padding: EdgeInsets.symmetric(horizontal: R.size(100)),
        children: [
          CustomText(
            text: 'For support, call: +212-704-254-879',
            color: AppColors.whiteSolid,
            fontSize: R.size(14),
            fontWeight: FontWeight.w600,
          ),
          CustomButton(
            height: R.size(40),
            text: 'French',
            textSize: R.size(14),
            textColor: AppColors.whiteSolid,
            fontWeight: FontWeight.w600,
            dropdownStyle: DropdownStyle(
                width: R.size(150),
                dropdownAlignment: DropdownAlignment.center),
            dropdownItems: [
              CustomDropdownMenuItem(
                  onTap: () {
                    print('french switch');
                  },
                  child: CustomButton(
                    height: R.size(40),
                    text: 'French',
                    textSize: R.size(14),
                  )),
              CustomDropdownMenuItem(
                  onTap: () {
                    print('English switch');
                  },
                  child: CustomButton(
                    height: R.size(40),
                    text: 'English',
                    textSize: R.size(14),
                  )),
            ],
          ),
        ]);
  }
}
