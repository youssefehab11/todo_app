import 'package:flutter/material.dart';

import 'colors_manager.dart';
import 'fonts_manager.dart';

class AppTextStyles {
  static const TextStyle appBarStyle = TextStyle(
    fontFamily: FontsManager.poppins,
    fontWeight: FontWeight.bold,
    fontSize: 22,
    color: Colors.white,

  );
  static const TextStyle text15WeightBold = TextStyle(
    fontFamily: FontsManager.roboto,
    fontWeight: FontWeight.bold,
    fontSize: 15,
    color: Colors.black,

  );
  static const TextStyle text22WeightBold = TextStyle(
    fontFamily: FontsManager.poppins,
    fontWeight: FontWeight.bold,
    fontSize: 22,
    color: ColorsManager.lightPrimaryColor,

  );
  static const TextStyle text16WeightNormal = TextStyle(
    fontFamily: FontsManager.roboto,
    fontWeight: FontWeight.normal,
    fontSize: 18,
    color: Colors.black,
  );
  static const TextStyle text20WeightNormal = TextStyle(
    fontFamily: FontsManager.inter,
    fontWeight: FontWeight.normal,
    fontSize: 20,
    color: ColorsManager.iconsGrayColor,
  );
  static const TextStyle text18WeightBold = TextStyle(
    fontFamily: FontsManager.poppins,
    fontWeight: FontWeight.bold,
    fontSize: 18,
    color: Colors.black,
  );
  static const TextStyle text18WeightNormal = TextStyle(
    fontFamily: FontsManager.inter,
    fontWeight: FontWeight.normal,
    fontSize: 18,
    color: ColorsManager.textGrayColor,
  );

}