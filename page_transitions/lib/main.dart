import 'package:flutter/material.dart';
import 'package:page_transitions/utils/utils.dart';
import 'package:page_transitions/utils/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Page transitions Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: Routes.homeScreen,
      onGenerateRoute: RouteGenerator.generateRoute,
      navigatorKey: navigatorKey,
    );
  }
}
