import 'package:flutter/material.dart';
import 'package:lmima_food/features/presentation/widgets/common/custom_text.dart';

import '../../../../../core/util/responsive_screen_adapter.dart';

class OffersComponent extends StatefulWidget {
  const OffersComponent({super.key});

  @override
  State<OffersComponent> createState() => _OffersComponentState();
}

class _OffersComponentState extends State<OffersComponent> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveScreenAdapter(
      defaultScreen: _buildDesktop(context),
      screenDesktop: _buildDesktop(context),
    );
  }

  Widget _buildDesktop(BuildContext context) {
    return const CustomText(text: 'offers');
  }
}
