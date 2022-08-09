import 'package:flutter/material.dart';
import 'package:user_friends/modules/core/design_system/app_fonts.dart';

import '../../../core/design_system/app_colors.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User profile')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage(
                  'https://randomuser.me/api/portraits/men/57.jpg'),
              backgroundColor: AppColors.transparent,
            ),
            const SizedBox(height: 20),
            Text(
              'Full Name',
              style: AppTextStyles.body20Bold,
            ),
            const SizedBox(height: 20),
            Text(
              'email@email.com',
              style: AppTextStyles.body,
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: () {}, child: const Text('See friends'))
          ],
        ),
      ),
    );
  }
}
