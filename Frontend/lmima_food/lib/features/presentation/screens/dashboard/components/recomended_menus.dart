import 'package:flutter/material.dart';
import 'package:lmima_food/features/presentation/widgets/common/custom_text.dart';

import '../../../../../core/util/responsive_screen_adapter.dart';

class RecomendedMenusComponent extends StatefulWidget {
  const RecomendedMenusComponent({super.key});

  @override
  State<RecomendedMenusComponent> createState() =>
      _RecomendedMenusComponentState();
}

class _RecomendedMenusComponentState extends State<RecomendedMenusComponent> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveScreenAdapter(
      defaultScreen: _buildDesktop(context),
      screenDesktop: _buildDesktop(context),
    );
  }

  Widget _buildDesktop(BuildContext context) {
    return const CustomText(text: 'recomended menus');
  }
}
