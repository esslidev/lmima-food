import 'package:flutter/material.dart';
import 'package:lmima_food/core/constants/app_colors.dart';
import 'package:lmima_food/core/constants/app_paths.dart';
import 'package:lmima_food/features/presentation/widgets/common/custom_button.dart';

import '../../../../core/util/responsive_size_adapter.dart';

class RatingStar extends StatefulWidget {
  final double? starSize;
  final bool? isActive;
  final VoidCallback? onPressed;
  const RatingStar({
    super.key,
    this.starSize,
    this.isActive,
    this.onPressed,
  });

  @override
  State<RatingStar> createState() => _RatingStarState();
}

class _RatingStarState extends State<RatingStar> {
  late ResponsiveSizeAdapter R;

  @override
  void initState() {
    super.initState();
    R = ResponsiveSizeAdapter(context);
  }

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      svgIconPath: AppPaths.vectors.ratingStarIcon,
      iconWidth: widget.starSize ?? R.size(6),
      iconColor: widget.isActive == true
          ? AppColors.light.primaryColor1
          : AppColors.light.primaryColor2.withOpacity(.2),
    );
  }
}
