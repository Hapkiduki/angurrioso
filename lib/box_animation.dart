import 'package:flutter/animation.dart';

class BoxAnimation {
  final AnimationController controller;
  final Animation<double> xAnimation;
  final Animation<double> yAnimation;

  const BoxAnimation({
    required this.controller,
    required this.xAnimation,
    required this.yAnimation,
  });
}
