import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:page_transitions/screens/home_screen.dart';
import 'package:page_transitions/screens/second_screen.dart';
import 'package:page_transitions/screens/slide_screen.dart';
import 'package:page_transitions/transitions/slide_builder.dart';

class Routes {
  static const homeScreen = '/home';
  static const slideScreen = '/slide';
  static const slideSecondScreen = '/slideSecond';
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    if (kDebugMode) print('RouteGenerator.generateRoute: ${settings.name}');
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (ctx) => const HomeScreen());
      case Routes.slideScreen:
        return SlidePageRouteBuilder(const SlideTransitionsScreen());
      case Routes.slideSecondScreen:
        try {
          final args = settings.arguments as SlidePageRouteBuilderArgs;
          return SlidePageRouteBuilder(const SecondScreen(), args: args);
        } catch (e) {
          return SlidePageRouteBuilder(const SecondScreen());
        }
      default:
        return _errorRoute(settings.name ?? '', settings);
    }
  }

  static Route<dynamic> _errorRoute(String name, RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('Erreur')),
        body: Center(
            child: Text(name.isEmpty
                ? 'No name passed. RouteSettings: $routeSettings'
                : 'View $name not found')),
      ),
    );
  }
}
