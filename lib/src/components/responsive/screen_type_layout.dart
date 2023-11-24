import 'package:flutter/material.dart';
import 'package:r_ext/src/components/responsive/builder.dart';
import 'package:r_ext/src/enum/device_screen_type.dart';

class ScreenTypeLayout extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;
  final Widget? desktop4k;

  const ScreenTypeLayout({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
    this.desktop4k,
  });

  Widget _returnFor4kDesktop() {
    if (desktop4k != null) {
      return desktop4k!;
    }

    if (desktop != null) {
      return desktop!;
    }

    if (tablet != null) {
      return tablet!;
    }

    return mobile;
  }

  Widget _returnForDesktop() {
    if (desktop != null) {
      return desktop!;
    }

    if (tablet != null) {
      return tablet!;
    }

    return mobile;
  }

  Widget _returnForTablet() {
    if (tablet != null) {
      return tablet!;
    }

    return mobile;
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: ((context, sizingInfo) {
        DeviceScreenType currentScreenType = sizingInfo.deviceScreenType;

        if (currentScreenType == DeviceScreenType.largeDesktop) {
          return _returnFor4kDesktop();
        }

        if (currentScreenType == DeviceScreenType.desktop) {
          return _returnForDesktop();
        }

        if (currentScreenType == DeviceScreenType.tablet) {
          return _returnForTablet();
        }

        return mobile;
      }),
    );
  }
}
