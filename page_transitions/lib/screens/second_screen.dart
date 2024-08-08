import 'package:flutter/material.dart';
import 'package:page_transitions/utils/utils.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: randomColor(),
      body: Center(
        child: GestureDetector(
          onTap: () => navigatorKey.currentState?.pop(),
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white, shape: BoxShape.circle),
            height: 100,
            width: 100,
            child: const Icon(
              Icons.close_rounded,
              size: 40.0,
            ),
          ),
        ),
      ),
    );
  }
}
