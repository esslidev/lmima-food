import 'package:flutter/material.dart';
import 'package:lmima_food/core/enums/app_enums.dart';
import 'package:lmima_food/features/presentation/screens/intro/components/slide.dart';
import 'package:lmima_food/features/presentation/widgets/common/field.dart';

import '../../../../core/util/responsive_screen_adapter.dart';
import '../../../../core/util/responsive_size_adapter.dart';
import '../../widgets/common/custom_text.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  late ResponsiveSizeAdapter R;

  @override
  void initState() {
    super.initState();
    R = ResponsiveSizeAdapter(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ResponsiveScreenAdapter(
      defaultScreen: _buildDesktop(context),
      screenDesktop: _buildDesktop(context),
    ));
  }

  Widget _buildDesktop(BuildContext context) {
    return const CustomField(arrangement: FieldArrangement.column, children: [
      CustomText(text: 'intro'),
      SlideComponent(),
    ]);
  }
}
