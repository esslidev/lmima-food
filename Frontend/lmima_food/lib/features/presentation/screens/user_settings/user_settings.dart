import 'package:flutter/material.dart';

import '../../../../core/util/responsive_size_adapter.dart';
import '../../widgets/common/custom_text.dart';

class UserSettingsScreen extends StatefulWidget {
  const UserSettingsScreen({super.key});

  @override
  State<UserSettingsScreen> createState() => _UserSettingsScreenState();
}

class _UserSettingsScreenState extends State<UserSettingsScreen> {
  late ResponsiveSizeAdapter R;

  @override
  Widget build(BuildContext context) {
    R = ResponsiveSizeAdapter(context);

    return const CustomText(text: 'privacy policy');
  }
}
