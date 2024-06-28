import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/util/responsive_size_adapter.dart';

class TopBarWidget extends StatefulWidget {
  const TopBarWidget({super.key});

  @override
  State<TopBarWidget> createState() => _TopBarWidgetState();
}

class _TopBarWidgetState extends State<TopBarWidget> {
  late ResponsiveSizeAdapter R;

  @override
  Widget build(BuildContext context) {
    R = ResponsiveSizeAdapter(context);
    Size screenSize = MediaQuery.of(context).size;

    return Container(
      width: screenSize.width,
      padding:
          EdgeInsets.symmetric(vertical: R.size(10), horizontal: R.size(20)),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: AppColors.grayArsenic.withOpacity(0.3),
            width: R.size(.5),
          ),
        ),
      ),
      child: const Row(
        children: [],
      ),
    );
  }
}
