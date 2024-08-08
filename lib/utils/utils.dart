import 'dart:math';

import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

double getAngleFromAlignment(Alignment alignment) {
  switch (alignment) {
    case Alignment.topLeft:
      return pi / 4;
    case Alignment.topCenter:
      return pi / 2;
    case Alignment.topRight:
      return pi / 4 * 3;
    case Alignment.centerLeft:
      return 0;
    case Alignment.centerRight:
      return -pi;
    case Alignment.bottomLeft:
      return -pi / 4;
    case Alignment.bottomCenter:
      return -pi / 2;
    case Alignment.bottomRight:
      return -pi / 4 * 3;
    default:
      return 0;
  }
}

const colors = [
  Colors.red,
  Colors.green,
  Colors.blue,
  Colors.purple,
  Colors.orange,
  Colors.pink,
  Colors.yellow,
];

Color randomColor() => colors[Random().nextInt(colors.length)];
