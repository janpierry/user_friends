import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTextStyles {
  static final TextStyle noto16 = GoogleFonts.notoSans(
    color: AppColors.black,
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );

  static final TextStyle noto20Bold = GoogleFonts.notoSans(
    color: AppColors.purple,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
}
