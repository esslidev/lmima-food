import 'package:flutter/material.dart';
import 'package:lmima_food/features/presentation/widgets/common/custom_text.dart';

import '../../../../../core/util/responsive_screen_adapter.dart';

class NewsLetterTestimonialsComponent extends StatefulWidget {
  const NewsLetterTestimonialsComponent({super.key});

  @override
  State<NewsLetterTestimonialsComponent> createState() =>
      _NewsLetterTestimonialsComponentState();
}

class _NewsLetterTestimonialsComponentState
    extends State<NewsLetterTestimonialsComponent> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveScreenAdapter(
      defaultScreen: _buildDesktop(context),
      screenDesktop: _buildDesktop(context),
    );
  }

  Widget _buildDesktop(BuildContext context) {
    return const CustomText(text: 'newsletter & testimonials');
  }
}
