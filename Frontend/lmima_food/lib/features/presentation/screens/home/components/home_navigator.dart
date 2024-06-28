import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_paths.dart';
import '../../../../../core/resources/menu_model.dart';
import '../../../../../core/util/events_util.dart';
import '../../../../../core/util/route_path_service.dart';
import '../../../../../core/util/localization_service.dart';
import '../../../../../core/util/responsive_size_adapter.dart';
import '../../../../../locator.dart';
import '../../../bloc/app_blocs/route/route_bloc.dart';
import '../../../bloc/app_blocs/route/route_state.dart';
import '../../../widgets/custom_button.dart';

class HomeNavigatorWidget extends StatefulWidget {
  const HomeNavigatorWidget({super.key});

  @override
  State<HomeNavigatorWidget> createState() => _HomeNavigatorState();
}

class _HomeNavigatorState extends State<HomeNavigatorWidget> {
  late ResponsiveSizeAdapter R;
  final LocalizationService localizationService =
      locator<LocalizationService>();

  final RoutePathService routePathService = locator<RoutePathService>();

  late MenuModel dashboardMenuModel;
  late MenuModel userMenuModel;
  late MenuModel mealPlanMenuModel;
  late MenuModel fitnessPlanMenuModel;
  late MenuModel settingsMenuModel;
  late MenuModel signOutMenuModel;

  @override
  void initState() {
    super.initState();
    dashboardMenuModel =
        MenuModel(icon: AppPaths.vectors.dashboardIcon, title: "Dashboard");
    settingsMenuModel = MenuModel(
      icon: AppPaths.vectors.settingsIcon,
      title: "Settings",
    );
    signOutMenuModel = MenuModel(
      icon: AppPaths.vectors.signOutIcon,
      title: "Sign out",
    );
  }

  @override
  Widget build(BuildContext context) {
    R = ResponsiveSizeAdapter(context);
    Size screenSize = MediaQuery.of(context).size;

    return BlocListener<AppRouteBloc, AppRouteState>(
      listener: (context, state) {
        if (state is AppRoutePathUpdated) {
          setState(() {});
        }
      },
      child: Container(
        width: R.size(230),
        height: screenSize.height,
        padding:
            EdgeInsets.symmetric(vertical: R.size(30), horizontal: R.size(16)),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            right: BorderSide(
              color: AppColors.grayArsenic.withOpacity(0.3),
              width: R.size(0.5),
            ),
          ),
        ),
        child: Column(
          children: [
            _buildNavigatorHeader(
                logoPath: AppPaths.icons.icon,
                logoName: 'Verdant Lifestyle',
                responsiveSizeAdapter: R),
            SizedBox(
              height: R.size(40),
            ),
            Column(
              children: [
                _buildCustomButton(
                  icon: dashboardMenuModel.icon,
                  title: dashboardMenuModel.title,
                  isActive: AppPaths.routes.dashboardScreen ==
                      routePathService.currentPath,
                  onPressed: () {
                    setState(() {
                      EventsUtil.routeEvents
                          .updatePath(context, AppPaths.routes.dashboardScreen);
                      Beamer.of(context)
                          .beamToNamed(AppPaths.routes.dashboardScreen);
                    });
                  },
                ),
              ],
            ),
            const Spacer(),
            Column(
              children: [
                _buildCustomButton(
                  icon: settingsMenuModel.icon,
                  title: settingsMenuModel.title,
                  isActive: AppPaths.routes.settingsScreen ==
                      routePathService.currentPath,
                  onPressed: () {
                    setState(() {
                      EventsUtil.routeEvents
                          .updatePath(context, AppPaths.routes.settingsScreen);
                      Beamer.of(context)
                          .beamToNamed(AppPaths.routes.settingsScreen);
                    });
                  },
                ),
                _buildCustomButton(
                  icon: signOutMenuModel.icon,
                  title: signOutMenuModel.title,
                  iconColor: AppColors.redLingonBerry.withOpacity(0.8),
                  onPressed: () {
                    print('sign out');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigatorHeader({
    required String logoPath,
    required String logoName,
    required ResponsiveSizeAdapter responsiveSizeAdapter,
  }) {
    return Column(
      children: [
        if (logoPath.isNotEmpty)
          Image.asset(
            logoPath,
            width: responsiveSizeAdapter.size(80),
            height: responsiveSizeAdapter.size(80),
          ),
        if (logoPath.isNotEmpty)
          SizedBox(height: responsiveSizeAdapter.size(8)),
        Text(
          logoName,
          style: TextStyle(
            fontSize: responsiveSizeAdapter.size(13),
            fontWeight: FontWeight.w600,
            color: AppColors.grayArsenic,
          ),
        ),
      ],
    );
  }

  Widget _buildCustomButton({
    required String title,
    required String icon,
    Color? iconColor,
    bool isActive = false,
    VoidCallback? onPressed,
  }) {
    return CustomButton(
      text: title,
      textSize: R.size(11),
      textColor: AppColors.grayArsenic,
      fontWeight: FontWeight.w500,
      padding: EdgeInsets.symmetric(
        vertical: R.size(10),
        horizontal: R.size(16),
      ),
      margin: EdgeInsets.only(bottom: R.size(6)),
      borderRadius: R.size(2),
      svgIconPath: icon,
      iconWidth: R.size(18),
      iconColor: iconColor ?? AppColors.greenBianchi,
      isActive: isActive,
      onActiveStyle: CustomButtonStyle(
        textColor: Colors.white,
        backgroundColor: AppColors.greenBianchi,
        iconColor: Colors.white,
      ),
      onHoverStyle: CustomButtonStyle(
        textColor: AppColors.grayArsenic,
        iconColor: iconColor ?? AppColors.greenBianchi,
        backgroundColor: AppColors.whiteSolid,
      ),
      onPressed: onPressed,
    );
  }
}
