import 'package:flutter/material.dart';

import '../../../../core/util/responsive_screen_adapter.dart';
import '../../../../core/util/responsive_size_adapter.dart';
import '../../widgets/common/custom_text.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
    return const CustomText(text: 'sign-in');
  }
}
