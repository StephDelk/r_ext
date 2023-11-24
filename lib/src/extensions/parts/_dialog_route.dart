part of '../build_context.dart';

class _CustomDialogRoute<T> extends PopupRoute<T> {
  final Widget Function(BuildContext context) builder;

  @override
  Color? get barrierColor => Colors.black.withOpacity(0.65);

  @override
  bool get barrierDismissible => false;

  @override
  String? get barrierLabel => 'CustomDialog';

  @override
  Duration get transitionDuration => const Duration(milliseconds: 250);

  _CustomDialogRoute({
    required this.builder,
    super.settings,
  });

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    // return just a static widget
    return builder(context);
  }

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    // random animations go 🔪 🔪 🔪
    return RotationTransition(
      turns: Tween<double>(begin: 0.25, end: 0).animate(animation),
      child: ScaleTransition(
        scale: animation,
        child: child,
      ),
    );
  }
}
