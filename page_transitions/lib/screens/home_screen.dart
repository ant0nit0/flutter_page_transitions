import 'package:flutter/material.dart';
import 'package:page_transitions/utils/utils.dart';
import 'package:page_transitions/utils/kbutton.dart';
import 'package:page_transitions/utils/router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: KButton(
          text: 'Slide transitions',
          onTap: () => navigatorKey.currentState!.pushNamed(Routes.slideScreen),
        ),
      ),
    );
  }
}
