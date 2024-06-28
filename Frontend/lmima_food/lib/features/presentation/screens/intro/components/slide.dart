import 'package:flutter/material.dart';
import 'package:lmima_food/features/presentation/widgets/common/custom_text.dart';

import '../../../../../core/util/responsive_screen_adapter.dart';

class SlideComponent extends StatefulWidget {
  const SlideComponent({super.key});

  @override
  State<SlideComponent> createState() => _SlideComponentState();
}

class _SlideComponentState extends State<SlideComponent> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveScreenAdapter(
      defaultScreen: _buildDesktop(context),
      screenDesktop: _buildDesktop(context),
    );
  }

  Widget _buildDesktop(BuildContext context) {
    return const CustomText(text: 'slide');
  }
}
