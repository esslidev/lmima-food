import 'package:flutter/material.dart';

import '../../../../../core/util/responsive_screen_adapter.dart';
import '../../../../../core/util/responsive_size_adapter.dart';
import '../../widgets/common/custom_text.dart';

class OurPoliciesScreen extends StatefulWidget {
  const OurPoliciesScreen({super.key});

  @override
  State<OurPoliciesScreen> createState() => _OurPoliciesScreenState();
}

class _OurPoliciesScreenState extends State<OurPoliciesScreen> {
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
    return const CustomText(text: 'our policy');
  }
}
