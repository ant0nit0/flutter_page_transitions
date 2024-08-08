import 'package:flutter/material.dart';
import 'package:page_transitions/transitions/slide_directions.dart';

class SlidePageRouteBuilderArgs {
  final Offset? beginOffset;
  final Offset? endOffset;
  final Curve curve;
  final SlideDirection direction;
  final Duration duration;
  final bool fade;

  // Proxy to the PageRouteBuilder
  final Duration? reverseDuration;
  final bool opaque;
  final bool barrierDismissible;
  final Color? barrierColor;
  final String? barrierLabel;
  final bool maintainState;
  final bool fullscreenDialog;
  final bool allowSnapshotting;
  final RouteSettings? settings;
  final RouteTransitionsBuilder? transitionsBuilder;

  const SlidePageRouteBuilderArgs({
    this.beginOffset,
    this.endOffset,
    this.duration = kSlideTransitionDuration,
    this.curve = Curves.easeInOut,
    this.direction = SlideDirection.bottomToTop,
    this.reverseDuration,
    this.fade = false,
    this.opaque = true,
    this.barrierDismissible = false,
    this.barrierColor,
    this.barrierLabel,
    this.maintainState = true,
    this.fullscreenDialog = false,
    this.allowSnapshotting = true,
    this.settings,
    this.transitionsBuilder,
  });
}

class SlidePageRouteBuilder extends PageRouteBuilder {
  final SlidePageRouteBuilderArgs args;
  final Widget page;

  SlidePageRouteBuilder(
    this.page, {
    this.args = const SlidePageRouteBuilderArgs(),
  }) : super(
          opaque: args.opaque,
          barrierDismissible: args.barrierDismissible,
          barrierColor: args.barrierColor,
          barrierLabel: args.barrierLabel,
          maintainState: args.maintainState,
          fullscreenDialog: args.fullscreenDialog,
          allowSnapshotting: args.allowSnapshotting,
          settings: args.settings,
          transitionDuration: args.duration,
          reverseTransitionDuration: args.reverseDuration ?? args.duration,
          pageBuilder: (context, animation, secondaryAnimation) {
            final begin =
                args.beginOffset ?? calculateBeginOffset(args.direction);
            final end = args.endOffset ?? Offset.zero;

            final tween = Tween(begin: begin, end: end).chain(
              CurveTween(curve: args.curve),
            );
            final offsetAnimation = animation.drive(tween);

            return FadeTransition(
              opacity: animation
                  .drive(Tween(begin: args.fade ? 0.0 : 1.0, end: 1.0).chain(
                CurveTween(curve: args.curve),
              )),
              child: SlideTransition(
                position: offsetAnimation,
                child: page,
              ),
            );
          },
        );
}
