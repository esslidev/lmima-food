import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../config/theme/app_themes.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_paths.dart';
import '../../../core/util/events_util.dart';
import '../../../core/util/route_path_service.dart';
import '../../../core/util/responsive_size_adapter.dart';
import '../../../locator.dart';
import 'custom_button.dart';

class BreadCrumbs extends StatefulWidget {
  const BreadCrumbs({super.key});

  @override
  State<BreadCrumbs> createState() => _BreadCrumbsWidgetState();
}

class _BreadCrumbsWidgetState extends State<BreadCrumbs> {
  late ResponsiveSizeAdapter R;
  final RoutePathService routePathService = locator<RoutePathService>();

  late List<String> routeTree;

  @override
  void initState() {
    super.initState();
    routeTree = routePathService.currentPath
        .split('/')
        .where((element) => element.isNotEmpty)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    R = ResponsiveSizeAdapter(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppPaths.routes.getRouteName(routePathService.currentPath),
            style: AppThemes.headline
                .copyWith(fontSize: R.size(26), letterSpacing: R.size(0.5))),
        SizedBox(
          height: R.size(2),
        ),
        Row(
          children: [
            ..._buildRouteButtons(context),
          ],
        )
      ],
    );
  }

  List<Widget> _buildRouteButtons(BuildContext context) {
    List<Widget> widgets = [];
    List<String> breadCrumbsPaths = [];

    for (int i = 0; i <= routeTree.length - 1; i++) {
      breadCrumbsPaths.add('${breadCrumbsPaths.join('')}/${routeTree[i]}');
      if (i == 0) {
        widgets.add(_buildCustomButton(
          title: AppPaths.routes.getRouteName(breadCrumbsPaths[i]),
          icon: AppPaths.vectors.homeIcon,
        ));
        widgets.add(
          SvgPicture.asset(
            AppPaths.vectors.greaterThanIcon,
            color: AppColors.grayArsenic,
            width: R.size(6),
          ),
        );
      } else if (i == routeTree.length - 1) {
        widgets.add(_buildCustomButton(
          title: AppPaths.routes.getRouteName(breadCrumbsPaths[i]),
          onPressed: () {
            setState(() {
              EventsUtil.routeEvents.updatePath(context, breadCrumbsPaths[i]);
              Beamer.of(context).beamToNamed(breadCrumbsPaths[i]);
            });
          },
          textColor: AppColors.greenBianchi,
        ));
      } else {
        widgets.add(_buildCustomButton(
          title: AppPaths.routes.getRouteName(breadCrumbsPaths[i]),
          onPressed: () {
            setState(() {
              EventsUtil.routeEvents.updatePath(context, breadCrumbsPaths[i]);
              Beamer.of(context).beamToNamed(breadCrumbsPaths[i]);
            });
          },
        ));
        widgets.add(SvgPicture.asset(
          AppPaths.vectors.greaterThanIcon,
          color: AppColors.grayArsenic,
          width: R.size(6),
        ));
      }
    }
    return widgets;
  }

  Widget _buildCustomButton({
    required String title,
    String? icon,
    Color? textColor,
    VoidCallback? onPressed,
  }) {
    return CustomButton(
      text: title,
      textSize: R.size(10),
      textColor: textColor ?? AppColors.grayArsenic,
      fontWeight: FontWeight.w500,
      padding: EdgeInsets.symmetric(
        vertical: R.size(5),
        horizontal: R.size(5),
      ),
      margin: EdgeInsets.symmetric(horizontal: R.size(3)),
      borderRadius: R.size(2),
      svgIconPath: icon,
      iconWidth: R.size(12),
      iconColor: AppColors.grayArsenic,
      iconTextPadding: R.size(4),
      onHoverStyle: CustomButtonStyle(
        textColor: textColor ?? AppColors.grayArsenic,
        iconColor: AppColors.grayArsenic,
        backgroundColor: AppColors.grayArsenic.withOpacity(0.08),
      ),
      onPressed: onPressed,
    );
  }
}
