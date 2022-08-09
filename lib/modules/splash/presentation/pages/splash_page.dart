import 'package:flutter/material.dart';
import 'package:user_friends/modules/core/design_system/app_gradients.dart';
import 'package:user_friends/modules/core/images/app_images.dart';

import '../../../core/design_system/app_colors.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(gradient: AppGradients.linear),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100),
          child: Image.asset(
            AppImages.splashIcon,
            color: AppColors.white.withOpacity(0.9),
          ),
        ),
      ),
    ));
  }
}
