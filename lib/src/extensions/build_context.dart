import 'package:flutter/material.dart';

part './parts/_dialog_route.dart';

extension ContextExt on BuildContext {
  Size get mediaQuerySize => MediaQuery.of(this).size;

  double get screenWidth => mediaQuerySize.width;
  double get screenHeight => mediaQuerySize.height;

  double get headerText => screenWidth * 0.06;
  double get largeText => screenWidth * 0.05;
  double get mediumText => screenWidth * 0.04;
  double get smallText => screenWidth * 0.03;
  double get tinyText => screenWidth * 0.02;

  Future<T?> showCustomDialog<T extends Object?>(Widget child,
      {RouteSettings? settings}) {
    return Navigator.of(this).push<T>(
      _CustomDialogRoute<T>(
        builder: (_) => child,
        settings: settings,
      ),
    );
  }
}
