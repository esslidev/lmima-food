import 'package:flutter/material.dart';
import 'package:lmima_food/features/presentation/widgets/common/custom_text.dart';

import '../../../../../core/util/responsive_screen_adapter.dart';

class CategoriesProductsComponent extends StatefulWidget {
  const CategoriesProductsComponent({super.key});

  @override
  State<CategoriesProductsComponent> createState() =>
      _CategoriesProductsComponentState();
}

class _CategoriesProductsComponentState
    extends State<CategoriesProductsComponent> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveScreenAdapter(
      defaultScreen: _buildDesktop(context),
      screenDesktop: _buildDesktop(context),
    );
  }

  Widget _buildDesktop(BuildContext context) {
    return const CustomText(text: 'categories products');
  }
}
