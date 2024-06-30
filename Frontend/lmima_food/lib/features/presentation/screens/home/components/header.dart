import 'package:flutter/material.dart';
import 'package:lmima_food/core/constants/app_paths.dart';
import 'package:lmima_food/features/presentation/widgets/common/custom_button.dart';
import 'package:lmima_food/features/presentation/widgets/common/custom_text_field.dart';

import '../../../../../core/enums/app_enums.dart';
import '../../../../../core/resources/custom_dropdown_menu_item.dart';
import '../../../../../core/resources/drop_down_style.dart';
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
          CustomTextField(
            svgIconPath: AppPaths.vectors.searchIcon,
            iconHeight: R.size(20),
            hintText: 'Search',
            height: R.size(55),
            padding: EdgeInsets.symmetric(horizontal: R.size(20)),
            borderRadius: R.size(10),
            width: R.size(600),
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
            ],
            dropdownStyle: DropdownStyle(
                width: R.size(600), dropdownAlignment: DropdownAlignment.start),
          ),
          CustomField(
              arrangement: FieldArrangement.row,
              crossAxisAlignment: CrossAxisAlignment.center,
              gap: R.size(30),
              children: [
                CustomButton(
                  height: R.size(50),
                  svgIconPath: AppPaths.vectors.profileIcon,
                  iconHeight: R.size(20),
                  iconPosition: CustomButtonIconPosition.top,
                  text: 'Profile',
                  textSize: R.size(13),
                  fontWeight: FontWeight.w400,
                  dropdownStyle: DropdownStyle(
                      width: R.size(120),
                      dropdownAlignment: DropdownAlignment.center),
                  dropdownItems: [
                    CustomDropdownMenuItem(
                        onTap: () {
                          print('Sign-in');
                        },
                        child: CustomButton(
                          height: R.size(40),
                          text: 'Sign-in',
                          textSize: R.size(14),
                        )),
                    CustomDropdownMenuItem(
                        onTap: () {
                          print('Sign-up');
                        },
                        child: CustomButton(
                          height: R.size(40),
                          text: 'Sign-up',
                          textSize: R.size(14),
                        )),
                    CustomDropdownMenuItem(
                        onTap: () {
                          print('User Settings');
                        },
                        child: CustomButton(
                          height: R.size(40),
                          text: 'User Settings',
                          textSize: R.size(14),
                        )),
                  ],
                ),
                CustomButton(
                  svgIconPath: AppPaths.vectors.wishlistIcon,
                  iconHeight: R.size(20),
                  iconPosition: CustomButtonIconPosition.top,
                  text: 'Wishlist',
                  textSize: R.size(13),
                ),
                CustomButton(
                  svgIconPath: AppPaths.vectors.cartIcon,
                  iconHeight: R.size(20),
                  iconPosition: CustomButtonIconPosition.top,
                  text: 'My Cart',
                  textSize: R.size(13),
                ),
              ]),
        ]);
  }
}
