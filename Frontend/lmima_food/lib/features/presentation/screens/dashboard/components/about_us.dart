import 'package:flutter/material.dart';
import 'package:lmima_food/features/presentation/widgets/common/custom_text.dart';

import '../../../../../core/util/responsive_screen_adapter.dart';

class AboutUsComponent extends StatefulWidget {
  const AboutUsComponent({super.key});

  @override
  State<AboutUsComponent> createState() => _AboutUsComponentState();
}

class _AboutUsComponentState extends State<AboutUsComponent> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveScreenAdapter(
      defaultScreen: _buildDesktop(context),
      screenDesktop: _buildDesktop(context),
    );
  }

  Widget _buildDesktop(BuildContext context) {
    return const CustomText(text: 'about us');
  }
}
