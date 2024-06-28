import 'package:flutter/material.dart';

class ResponsiveScreenAdapter extends StatelessWidget {
  final Widget defaultScreen;
  final Widget? screenMobile;
  final Widget? screenTablet;
  final Widget? screenDesktop;

  const ResponsiveScreenAdapter({
    super.key,
    required this.defaultScreen,
    this.screenMobile,
    this.screenTablet,
    this.screenDesktop,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    if (screenMobile != null && width < 768) {
      print('mobile');
      return screenMobile!;
    } else if (screenTablet != null && width < 1200 && width >= 768) {
      print('tablet');
      return screenTablet!;
    } else if (screenDesktop != null && width >= 1200) {
      print('desktop');
      return screenDesktop!;
    } else {
      return defaultScreen;
    }
  }
}
