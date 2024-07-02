import 'package:flutter/material.dart';
import 'package:lmima_food/features/presentation/widgets/features/offer_item_card.dart';

import '../../../../../core/constants/app_paths.dart';
import '../../../../../core/enums/app_enums.dart';
import '../../../../../core/util/responsive_screen_adapter.dart';
import '../../../../../core/util/responsive_size_adapter.dart';
import '../../../widgets/common/field.dart';

class OffersComponent extends StatefulWidget {
  const OffersComponent({super.key});

  @override
  State<OffersComponent> createState() => _OffersComponentState();
}

class _OffersComponentState extends State<OffersComponent> {
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
    return CustomField(
        arrangement: FieldArrangement.row,
        margin: EdgeInsets.only(top: R.size(40), bottom: R.size(20)),
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        padding: EdgeInsets.symmetric(horizontal: R.size(250)),
        gap: R.size(20),
        children: [
          OfferItemCard(
            backgroundImage: AppPaths.images.offerBackground1,
            width: R.size(600),
            height: R.size(600),
            borderRadius: R.size(20),
          ),
          CustomField(
            arrangement: FieldArrangement.column,
            margin: EdgeInsets.only(top: R.size(40), bottom: R.size(20)),
            padding: EdgeInsets.symmetric(horizontal: R.size(250)),
            gap: R.size(20),
            children: [
              OfferItemCard(
                backgroundImage: AppPaths.images.offerBackground2,
                width: R.size(600),
                height: R.size(300),
                borderRadius: R.size(20),
              ),
              OfferItemCard(
                backgroundImage: AppPaths.images.offerBackground3,
                width: R.size(600),
                height: R.size(300),
                borderRadius: R.size(20),
              ),
            ],
          ),
        ]);
  }
}
