import 'package:flutter/material.dart';
import 'package:page_transitions/utils/kbutton.dart';
import 'package:page_transitions/utils/router.dart';
import 'package:page_transitions/utils/utils.dart';

class LinesTranisionScreen extends StatelessWidget {
  const LinesTranisionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lime,
      body: Padding(
        padding: const EdgeInsets.only(
            top: 80.0, bottom: 40.0, left: 24.0, right: 24.0),
        child: Stack(
          children: [
            _iconButton(alignment: Alignment.topLeft),
          ],
        ),
      ),
    );
  }

  Align _iconButton({
    // required SlideDirection direction,
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
                // arguments: SlidePageRouteBuilderArgs(
                //     direction: direction, fade: fade)),
              ),
            ),
          ),
        ),
      );
}
