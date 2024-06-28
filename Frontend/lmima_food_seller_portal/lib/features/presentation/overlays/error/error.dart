import 'package:flutter/material.dart';

import '../../../../config/theme/app_themes.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/util/localization_service.dart';
import '../../../../core/util/responsive_screen_adapter.dart';
import '../../../../core/util/responsive_size_adapter.dart';

class ErrorOverlay {
  final BuildContext context;
  final LocalizationService localizationService;

  ErrorOverlay({
    required this.context,
    required this.localizationService,
  });

  OverlayEntry? _overlayEntry;

  void show({String? statusCode, String? error, String? errorMessage}) {
    _overlayEntry = OverlayEntry(
      builder: (context) => Material(
        color: Colors.transparent,
        child: ResponsiveScreenAdapter(
          defaultScreen: _buildDialogMobile(
              statusCode: statusCode, error: error, errorMessage: errorMessage),
          screenMobile: _buildDialogMobile(
              statusCode: statusCode, error: error, errorMessage: errorMessage),
        ),
      ),
    );
    Overlay.of(context).insert(_overlayEntry!);
  }

  void hide() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  Widget _buildDialogMobile(
      {String? statusCode, String? error, String? errorMessage}) {
    final ResponsiveSizeAdapter R = ResponsiveSizeAdapter(context);

    return Container(
      color: Colors.black.withOpacity(0.5),
      child: Center(
        child: Container(
          width: R.size(600),
          padding: EdgeInsets.all(R.size(40)),
          decoration: BoxDecoration(
            color: Colors.white, // White background
            borderRadius: BorderRadius.circular(R.size(4)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                statusCode ??
                    localizationService
                        .translate('errorScreen.defaultStatusCode'),
                textAlign: TextAlign.center,
                style: AppThemes.headline.copyWith(
                    fontSize: R.size(60),
                    letterSpacing: R.size(5),
                    color: AppColors.greenGoblin.withOpacity(.8)),
              ),
              SizedBox(height: R.size(20)),
              Text(
                  error ??
                      localizationService.translate('errorScreen.defaultError'),
                  textAlign: TextAlign.center,
                  style: AppThemes.secondaryHeadline.copyWith(
                      fontSize: R.size(30),
                      letterSpacing: R.size(5),
                      color: AppColors.grayArsenic)),
              SizedBox(height: R.size(20)),
              Text(
                  errorMessage ??
                      localizationService
                          .translate('errorScreen.defaultErrorMessage'),
                  textAlign: TextAlign.center,
                  style: AppThemes.bodyText.copyWith(
                      fontSize: R.size(25), color: AppColors.grayArsenic)),
              SizedBox(height: R.size(20)),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: AppColors.greenGoblin,
                  elevation: 0,
                  padding: R.padding(20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(R.size(10)),
                  ),
                ),
                onPressed: () {
                  hide();
                },
                child: Text(
                  localizationService.translate('errorScreen.close'),
                  style: TextStyle(fontSize: R.size(30)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
