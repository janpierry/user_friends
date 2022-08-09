import 'package:flutter/material.dart';
import 'package:user_friends/modules/core/design_system/app_gradients.dart';
import 'package:user_friends/modules/core/images/app_images.dart';
import 'package:user_friends/modules/user_profile/presentation/pages/user_profile_page.dart';

import '../../../core/design_system/app_colors.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2)).then(
      (_) => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const UserProfilePage()),
      ),
    );

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
