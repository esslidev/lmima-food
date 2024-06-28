import 'package:flutter/material.dart';

import '../../../../core/util/responsive_screen_adapter.dart';
import '../../../../core/util/responsive_size_adapter.dart';
import '../../widgets/common/custom_text.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
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
    return const CustomText(text: 'forgot password');
  }
}
