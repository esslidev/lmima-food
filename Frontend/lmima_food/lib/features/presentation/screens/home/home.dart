import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import '../../../../config/routes/home_routes.dart';
import '../../../../core/util/route_path_service.dart';
import '../../../../core/util/localization_service.dart';
import '../../../../core/util/responsive_screen_adapter.dart';
import '../../../../core/util/responsive_size_adapter.dart';
import '../../../../locator.dart';
import 'components/home_navigator.dart';
import 'components/top_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ResponsiveSizeAdapter R;

  final LocalizationService localizationService =
      locator<LocalizationService>();

  @override
  void initState() {
    super.initState();
    R = ResponsiveSizeAdapter(context);
  }

  @override
  Widget build(BuildContext context) {
    // Update route path in RoutePathService
    locator<RoutePathService>().updatePath(
      Beamer.of(context).currentBeamLocation.state.routeInformation.uri.path,
    );

    return Scaffold(
        body: ResponsiveScreenAdapter(
      defaultScreen: _buildDesktop(context),
      screenMobile: _buildDesktop(context),
      screenDesktop: _buildDesktop(context),
    ));
  }

  Widget _buildMobile(BuildContext context) {
    return const Center(child: Text('mobile'));
  }

  Widget _buildTablet(BuildContext context) {
    return const Center(child: Text('tablet'));
  }

  Widget _buildDesktop(BuildContext context) {
    return Row(
      children: [
        // Custom Sidebar (Replace with your own buttons)
        const HomeNavigatorWidget(),
        // Content Area (Based on the selected route)
        Expanded(
          child: Column(
            children: [
              const TopBarWidget(),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: R.size(30), horizontal: R.size(30)),
                  child: Beamer(
                    routerDelegate: HomeRoutes.homeBeamerDelegate,
                    backButtonDispatcher: BeamerBackButtonDispatcher(
                        delegate: HomeRoutes.homeBeamerDelegate),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
