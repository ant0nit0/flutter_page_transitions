import 'package:flutter/material.dart';
import 'package:page_transitions/transitions/slide_builder.dart';
import 'package:page_transitions/transitions/slide_directions.dart';
import 'package:page_transitions/utils/utils.dart';
import 'package:page_transitions/utils/kbutton.dart';
import 'package:page_transitions/utils/router.dart';

class SlideTransitionsScreen extends StatefulWidget {
  const SlideTransitionsScreen({super.key});

  @override
  State<SlideTransitionsScreen> createState() => _SlideTransitionsScreenState();
}

class _SlideTransitionsScreenState extends State<SlideTransitionsScreen> {
  bool fade = false;
  Duration duration = kSlideTransitionDuration;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      body: Padding(
        padding: const EdgeInsets.only(
            top: 80.0, bottom: 40.0, left: 24.0, right: 24.0),
        child: Stack(
          children: [
            _iconButton(
                direction: SlideDirection.topLeftToBottomRight,
                alignment: Alignment.topLeft),
            _iconButton(
                direction: SlideDirection.topToBottom,
                alignment: Alignment.topCenter),
            _iconButton(
                direction: SlideDirection.topRightToBottomLeft,
                alignment: Alignment.topRight),
            _iconButton(
                direction: SlideDirection.leftToRight,
                alignment: Alignment.centerLeft),
            _iconButton(
                direction: SlideDirection.rightToLeft,
                alignment: Alignment.centerRight),
            _iconButton(
                direction: SlideDirection.bottomLeftToTopRight,
                alignment: Alignment.bottomLeft),
            _iconButton(
                direction: SlideDirection.bottomToTop,
                alignment: Alignment.bottomCenter),
            _iconButton(
                direction: SlideDirection.bottomRightToTopLeft,
                alignment: Alignment.bottomRight),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  KButton(
                    text: 'Go back',
                    onTap: () => navigatorKey.currentState?.pop(),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  KButton(
                    text: '${fade ? 'Deactivate' : 'Activate'} fade',
                    onTap: toggleFade,
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  Text('Duration: ${duration.inMilliseconds} ms'),
                  Slider(
                      max: 5000,
                      value: duration.inMilliseconds.toDouble(),
                      onChanged: (value) {
                        setState(() {
                          print(value);
                          duration = Duration(milliseconds: value.toInt());
                        });
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void toggleFade() {
    setState(() {
      fade = !fade;
    });
  }

  Align _iconButton({
    required SlideDirection direction,
    required Alignment alignment,
  }) =>
      Align(
          alignment: alignment,
          child: Container(
            height: 40,
            width: 40,
            decoration:
                const BoxDecoration(color: kWhite, shape: BoxShape.circle),
            child: Transform.rotate(
              angle: getAngleFromAlignment(alignment),
              child: IconButton(
                icon: const Icon(Icons.arrow_forward_rounded),
                onPressed: () => navigatorKey.currentState?.pushNamed(
                  Routes.slideSecondScreen,
                  arguments: SlidePageRouteBuilderArgs(
                    direction: direction,
                    fade: fade,
                    duration: duration,
                  ),
                ),
              ),
            ),
          ));
}
