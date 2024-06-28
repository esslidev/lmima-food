import 'package:flutter/material.dart';

import '../../../../core/util/responsive_screen_adapter.dart';
import '../../../../core/util/responsive_size_adapter.dart';
import '../../widgets/common/custom_text.dart';

class MenuDetailsScreen extends StatefulWidget {
  const MenuDetailsScreen({super.key});

  @override
  State<MenuDetailsScreen> createState() => _MenuDetailsScreenState();
}

class _MenuDetailsScreenState extends State<MenuDetailsScreen> {
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
    return const CustomText(text: 'menu details');
  }
}
