import 'package:flutter/material.dart';
import 'package:lmima_food/core/enums/app_enums.dart';
import 'package:lmima_food/features/presentation/widgets/common/field.dart';
import 'package:lmima_food/features/presentation/widgets/features/rating_star.dart';

import '../../../../core/util/responsive_size_adapter.dart';

class RatingStarsField extends StatefulWidget {
  final double? starsSize;
  final int rate;
  final VoidCallback? onPressed;
  const RatingStarsField({
    super.key,
    this.starsSize,
    this.rate = 0,
    this.onPressed,
  });

  @override
  State<RatingStarsField> createState() => _RatingStarsFieldState();
}

class _RatingStarsFieldState extends State<RatingStarsField> {
  late ResponsiveSizeAdapter R;

  @override
  void initState() {
    super.initState();
    R = ResponsiveSizeAdapter(context);
  }

  @override
  Widget build(BuildContext context) {
    return CustomField(
        arrangement: FieldArrangement.row,
        gap: R.size(4),
        children: [
          RatingStar(
            starSize: widget.starsSize,
            isActive: widget.rate >= 1,
            onPressed: widget.onPressed,
          ),
          RatingStar(
            starSize: widget.starsSize,
            isActive: widget.rate >= 2,
            onPressed: widget.onPressed,
          ),
          RatingStar(
            starSize: widget.starsSize,
            isActive: widget.rate >= 3,
            onPressed: widget.onPressed,
          ),
          RatingStar(
            starSize: widget.starsSize,
            isActive: widget.rate >= 4,
            onPressed: widget.onPressed,
          ),
          RatingStar(
            starSize: widget.starsSize,
            isActive: widget.rate >= 5,
            onPressed: widget.onPressed,
          )
        ]);
  }
}
