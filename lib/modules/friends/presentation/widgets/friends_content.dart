import 'package:flutter/material.dart';
import 'package:user_friends/modules/core/design_system/app_fonts.dart';

import '../../../core/design_system/app_colors.dart';
import '../../../shared/domain/entities/user.dart';

class FriendsContent extends StatelessWidget {
  final List<User> friends;

  const FriendsContent({Key? key, required this.friends}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: friends.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: CircleAvatar(
              radius: 28,
              backgroundColor: AppColors.transparent,
              backgroundImage: NetworkImage(friends[index].photoUrl),
            ),
            title: Text(
              friends[index].name,
              style: AppTextStyles.noto16,
            ),
          ),
        );
      },
      separatorBuilder: (_, __) => const Divider(),
    );
  }
}
