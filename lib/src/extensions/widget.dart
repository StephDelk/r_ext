import 'package:flutter/material.dart';

extension WidgetExt on Widget {
  Widget withPadding(EdgeInsets insets) => Padding(
        padding: insets,
        child: this,
      );

  Widget withScrollbar() => Scrollbar(
        thumbVisibility: true,
        child: this,
      );

  Widget withControlledScollbar(ScrollController controller) => Scrollbar(
        controller: controller,
        thumbVisibility: true,
        child: this,
      );
}

extension SpaceExt on num {
  SizedBox get ph => SizedBox(height: toDouble());
  SizedBox get pw => SizedBox(width: toDouble());
  SizedBox get ps => SizedBox(
        width: toDouble(),
        height: toDouble(),
      );
}
