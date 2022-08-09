import 'package:flutter/material.dart';
import 'package:user_friends/modules/core/design_system/app_colors.dart';

class FriendsPage extends StatelessWidget {
  const FriendsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Friend list')),
        body: ListView.separated(
          itemCount: 15,
          itemBuilder: (context, index) {
            return const ListTile(
              leading: CircleAvatar(
                radius: 28,
                backgroundColor: AppColors.transparent,
                backgroundImage: NetworkImage(
                    'https://randomuser.me/api/portraits/men/7.jpg'),
              ),
              title: Text('Full name'),
            );
          },
          separatorBuilder: (_, __) => const Divider(),
        ));
  }
}
