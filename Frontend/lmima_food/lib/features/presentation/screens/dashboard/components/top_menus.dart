import 'package:flutter/material.dart';
import 'package:lmima_food/features/presentation/widgets/common/custom_text.dart';

import '../../../../../core/util/responsive_screen_adapter.dart';

class TopMenusComponent extends StatefulWidget {
  const TopMenusComponent({super.key});

  @override
  State<TopMenusComponent> createState() => _TopMenusComponentState();
}

class _TopMenusComponentState extends State<TopMenusComponent> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveScreenAdapter(
      defaultScreen: _buildDesktop(context),
      screenDesktop: _buildDesktop(context),
    );
  }

  Widget _buildDesktop(BuildContext context) {
    return const CustomText(text: 'top menus');
  }
}
