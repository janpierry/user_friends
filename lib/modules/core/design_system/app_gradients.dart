import 'dart:math';

import 'package:flutter/material.dart';
import 'package:user_friends/modules/core/design_system/colors/app_colors.dart';

class AppGradients {
  static const linear = LinearGradient(colors: [
    AppColors.purple,
    AppColors.white,
  ], stops: [
    0.0,
    0.695
  ], transform: GradientRotation(2.13959913 * pi));
}
