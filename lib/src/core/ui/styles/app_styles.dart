import 'package:flutter/material.dart';

import 'colors_app.dart';

class AppStyles {
  static AppStyles? _instance;
  // Avoid self instance
  AppStyles._();
  static AppStyles get instance {
    _instance ??= AppStyles._();
    return _instance!;
  }

  ButtonStyle get buttonPrimary => ElevatedButton.styleFrom(
    backgroundColor: ColorsApp.instance.primary,
    //foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
  );
}

extension AppStylesExtension on BuildContext {
  AppStyles get appStyles => AppStyles.instance;
}
