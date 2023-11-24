import 'package:flutter/material.dart';
import 'package:r_ext/src/extensions/build_context.dart';

import 'parts/sizing_info.dart';

class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(
    BuildContext context,
    SizingInfo sizingInfo,
  ) builder;

  const ResponsiveBuilder({
    super.key,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        SizingInfo sizing = SizingInfo(
          deviceScreenType: context.deviceType,
          screenSize: context.mediaQuerySize,
          localWidgetSize: Size(constraints.maxWidth, constraints.maxHeight),
        );

        return builder(context, sizing);
      },
    );
  }
}
