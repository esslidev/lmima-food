import 'package:flutter/material.dart';
import 'package:lmima_food/core/enums/app_enums.dart';
import 'package:lmima_food/features/presentation/screens/dashboard/components/about_us.dart';
import 'package:lmima_food/features/presentation/screens/dashboard/components/categories_products.dart';
import 'package:lmima_food/features/presentation/screens/dashboard/components/newsletter_testimonials.dart';
import 'package:lmima_food/features/presentation/screens/dashboard/components/offers.dart';
import 'package:lmima_food/features/presentation/screens/dashboard/components/recomended_menus.dart';
import 'package:lmima_food/features/presentation/screens/dashboard/components/slider.dart';
import 'package:lmima_food/features/presentation/screens/dashboard/components/top_menus.dart';
import 'package:lmima_food/features/presentation/widgets/common/field.dart';

import '../../../../core/util/responsive_screen_adapter.dart';
import '../../../../core/util/responsive_size_adapter.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
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
    return const CustomField(
      arrangement: FieldArrangement.column,
      children: [
        SliderComponent(),
        TopMenusComponent(),
        RecomendedMenusComponent(),
        OffersComponent(),
        CategoriesProductsComponent(),
        AboutUsComponent(),
        NewsLetterTestimonialsComponent(),
      ],
    );
  }
}
