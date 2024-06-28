import 'package:flutter/material.dart';
import '../../../../config/theme/app_themes.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/util/localization_service.dart';
import '../../../../core/util/responsive_screen_adapter.dart';
import '../../../../core/util/responsive_size_adapter.dart';

class BusyOverlay {
  final BuildContext context;
  final LocalizationService localizationService;

  BusyOverlay({
    required this.context,
    required this.localizationService,
  });

  OverlayEntry? _overlayEntry;

  void show() {
    _overlayEntry = OverlayEntry(
      builder: (context) => Material(
        color: Colors.transparent,
        child: ResponsiveScreenAdapter(
          defaultScreen: _buildDialogMobile(),
          screenMobile: _buildDialogMobile(),
        ),
      ),
    );
    Overlay.of(context).insert(_overlayEntry!);
  }

  void hide() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  Widget _buildDialogMobile() {
    final ResponsiveSizeAdapter R = ResponsiveSizeAdapter(context);
    return Container(
      color: Colors.black.withOpacity(0.5),
      child: Center(
        child: Container(
          width: R.size(450),
          padding: EdgeInsets.all(R.size(40)),
          decoration: BoxDecoration(
            color: Colors.white, // White background
            borderRadius: BorderRadius.circular(R.size(4)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                    AppColors.greenBianchi), // Green progress indicator
              ),
              SizedBox(height: R.size(20)),
              Text(localizationService.translate('loadingScreen.loading'),
                  style: AppThemes.bodyText.copyWith(
                      fontSize: R.size(25), color: AppColors.grayArsenic)),
            ],
          ),
        ),
      ),
    );
  }
}
