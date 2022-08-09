import 'dart:math';

import 'package:flutter/material.dart';

class AppGradients {
  static const linear = LinearGradient(colors: [
    Color.fromRGBO(130, 87, 229, 0.695),
    Color(0xFF57B6E5),
  ], stops: [
    0.0,
    0.695
  ], transform: GradientRotation(2.13959913 * pi));
}
