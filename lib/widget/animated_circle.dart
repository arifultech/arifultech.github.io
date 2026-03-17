import 'dart:ui';

import 'package:flutter/cupertino.dart';

Widget animatedCircle(double size, Color color) {
  return TweenAnimationBuilder(
    tween: Tween<double>(begin: 0.8, end: 1.2),
    duration: const Duration(seconds: 3),
    curve: Curves.easeInOut,
    builder: (context, double value, child) {
      return Transform.scale(
        scale: value,
        child: child,
      );
    },
    onEnd: () {},
    child: Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    ),
  );
}