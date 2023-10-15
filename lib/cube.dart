import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:developer' as dv;

class Cube extends StatelessWidget {
  const Cube(
      {super.key,
      required this.left,
      required this.right,
      required this.back,
      required this.front,
      required this.top,
      required this.bottom,
      required this.rx,
      required this.ry,
      required this.rz});

  final double rx;
  final double ry;
  final double rz;
  final Widget left;
  final Widget right;
  final Widget back;
  final Widget front;
  final Widget top;
  final Widget bottom;
  final double size = 200;

  int get _rotationX => rx.deg.round();
  int get _rotationY => ry.deg.round();
  int get _rotationZ => rz.deg.round();

  int get normalizedRotationY => _rotationY % 360;
  int get normalizedRotationX => _rotationX % 360;

  bool get _isFrontVisible =>
      (normalizedRotationY < 90 || normalizedRotationY > 270) &&
      (normalizedRotationX < 90 || normalizedRotationX > 270);
  bool get _isBackVisible =>
      (normalizedRotationY > 90 && normalizedRotationY < 270) ||
      (normalizedRotationX > 90 && normalizedRotationX < 270);
  bool get _isRightVisible =>
      normalizedRotationY > 18 && normalizedRotationY < 180;
  bool get _isLeftVisible =>
      normalizedRotationY > 0 && normalizedRotationY > 180;
  bool get _isBottomVisible => normalizedRotationX > 180;
  bool get _isTopVisible =>
      normalizedRotationX > 0 && normalizedRotationX < 180;

  @override
  Widget build(BuildContext context) {
    dv.log(normalizedRotationX.toString());

    return Stack(
      children: [
        if (_isFrontVisible)
          Transform(
            transform: Matrix4.identity()
              ..translate(0.0, 0.0, -100.0)
              ..rotateY(360.0.rad),
            alignment: Alignment.center,
            child: SizedBox(
              height: size,
              width: size,
              child: front,
            ),
          ),
        if (_isBackVisible)
          Transform(
            transform: Matrix4.identity()
              ..translate(0.0, 0.0, 100.0)
              ..rotateY(180.0.rad),
            alignment: Alignment.center,
            child: SizedBox(
              height: size,
              width: size,
              child: back,
            ),
          ),
        if (_isRightVisible)
          Transform(
            transform: Matrix4.identity()
              ..translate(100.0, 0.0, 0.0)
              ..rotateY(-pi / 2),
            alignment: Alignment.center,
            child: SizedBox(
              height: size,
              width: size,
              child: right,
            ),
          ),
        if (_isLeftVisible)
          Transform(
            transform: Matrix4.identity()
              ..translate(-100.0, 0.0, 0.0)
              ..rotateY(pi / 2),
            alignment: Alignment.center,
            child: SizedBox(
              height: size,
              width: size,
              child: left,
            ),
          ),
        if (_isBottomVisible)
          Transform(
            transform: Matrix4.identity()
              ..translate(0.0, 100.0, 0.0)
              ..rotateX(-270.0.rad),
            alignment: Alignment.center,
            child: SizedBox(
              height: size,
              width: size,
              child: bottom,
            ),
          ),
        if (_isTopVisible)
          Transform(
            transform: Matrix4.identity()
              ..translate(0.0, -100.0, 0.0)
              ..rotateX(270.0.rad),
            alignment: Alignment.center,
            child: SizedBox(
              height: size,
              width: size,
              child: top,
            ),
          ),
      ],
    );
  }
}

extension on double {
  double get rad => this * (pi / 180);
  double get deg => this * (180 / pi);
}
