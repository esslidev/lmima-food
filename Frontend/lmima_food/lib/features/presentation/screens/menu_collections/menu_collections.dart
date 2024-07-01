import 'package:flutter/material.dart';

import '../../../../core/util/responsive_screen_adapter.dart';
import '../../../../core/util/responsive_size_adapter.dart';
import '../../widgets/common/custom_text.dart';

class MenuCollectionsScreen extends StatefulWidget {
  const MenuCollectionsScreen({super.key});

  @override
  State<MenuCollectionsScreen> createState() => _MenuCollectionsScreenState();
}

class _MenuCollectionsScreenState extends State<MenuCollectionsScreen> {
  late ResponsiveSizeAdapter R;

  @override
  void initState() {
    super.initState();
    R = ResponsiveSizeAdapter(context);
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveScreenAdapter(
      defaultScreen: _buildDesktop(context),
      screenDesktop: _buildDesktop(context),
    );
  }

  Widget _buildDesktop(BuildContext context) {
    return const CustomText(text: 'menu collections');
  }
}
