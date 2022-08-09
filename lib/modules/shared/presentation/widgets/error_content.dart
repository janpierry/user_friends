import 'package:flutter/material.dart';
import 'package:user_friends/modules/core/design_system/app_fonts.dart';

class ErrorContent extends StatelessWidget {
  final String errorMessage;

  const ErrorContent({Key? key, required this.errorMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Center(child: Text(errorMessage, style: AppTextStyles.noto20Bold)),
    );
  }
}
