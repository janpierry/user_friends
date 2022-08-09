import 'package:flutter/material.dart';

import '../../../core/design_system/app_colors.dart';
import '../../../core/design_system/app_fonts.dart';
import '../../../friends/presentation/pages/friends_page.dart';
import '../../../shared/domain/entities/user.dart';

class ProfileContent extends StatelessWidget {
  final User mainUser;
  const ProfileContent({Key? key, required this.mainUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 70,
          backgroundImage: NetworkImage(mainUser.photoUrl),
          backgroundColor: AppColors.transparent,
        ),
        const SizedBox(height: 20),
        Text(
          mainUser.name,
          style: AppTextStyles.noto20Bold,
        ),
        const SizedBox(height: 20),
        Text(
          mainUser.email,
          style: AppTextStyles.noto16,
        ),
        const SizedBox(height: 20),
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FriendsPage(),
                  ));
            },
            child: const Text('See friends'))
      ],
    );
  }
}
