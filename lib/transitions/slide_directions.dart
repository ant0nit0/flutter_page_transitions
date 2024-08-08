import 'dart:ui';

const kSlideTransitionDuration = Duration(milliseconds: 800);

enum SlideDirection {
  bottomToTop,
  topToBottom,
  leftToRight,
  rightToLeft,
  bottomLeftToTopRight,
  bottomRightToTopLeft,
  topRightToBottomLeft,
  topLeftToBottomRight,
}

Offset calculateBeginOffset(SlideDirection direction) {
  switch (direction) {
    case SlideDirection.bottomToTop:
      return const Offset(0, 1);
    case SlideDirection.topToBottom:
      return const Offset(0, -1);
    case SlideDirection.leftToRight:
      return const Offset(-1, .0);
    case SlideDirection.rightToLeft:
      return const Offset(1, 0);
    case SlideDirection.bottomLeftToTopRight:
      return const Offset(-1, 1);
    case SlideDirection.bottomRightToTopLeft:
      return const Offset(1, 1);
    case SlideDirection.topLeftToBottomRight:
      return const Offset(-1, -1);
    case SlideDirection.topRightToBottomLeft:
      return const Offset(1, -1);
    default:
      return const Offset(0, 0);
  }
}
