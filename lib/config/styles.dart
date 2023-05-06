// ignore_for_file: non_constant_identifier_names, constant_identifier_names, prefer_const_declarations

import 'package:flutter/material.dart';
import 'package:oxyboots/config/size_config.dart';

class Styles {
  static final Color PrimaryColor = hexToColor('5B9EE1');
  static final Color ActionColor = hexToColor('FF5545');
  static final Color TextColor = hexToColor('1A1B1C');
  static final Color SubTextColor = hexToColor('707B81');
  static final Color BGColor = hexToColor('FFFFFF');
  static final Color FrameColor = hexToColor('F8F9FA');
  static final Color LineStock = hexToColor('E5EEF7');

  static const double OnBoardHeader = 40;
  static const double ButtonText = 18;
  static const double PrimaryHeaderFontSize = 20;
  static const double Secondary = 20;

  static final String PrimaryFontRegular = 'Muli';

  static final FontWeight primaryFontWeightSemiBold = FontWeight.w700;
  static final FontWeight primaryFontWeightLight = FontWeight.w300;

  static Color hexToColor(String code) {
    return Color(int.parse(code.substring(0, 6), radix: 16) + 0xFF000000);
  }

  static final TextStyle HOnBoard = TextStyle(
    color: Styles.TextColor,
    fontSize: SizeConfig.blockSizeHorizontal! * 10,
    fontFamily: Styles.PrimaryFontRegular,
    fontWeight: Styles.primaryFontWeightSemiBold,
  );

  static final TextStyle COnBoard = TextStyle(
    color: Styles.TextColor,
    fontSize: SizeConfig.blockSizeHorizontal! * 5,
    fontFamily: Styles.PrimaryFontRegular,
    fontWeight: Styles.primaryFontWeightLight,
  );

  static final TextStyle PrimaryHeader = TextStyle(
    color: Styles.TextColor,
    fontSize: SizeConfig.blockSizeHorizontal! * 8,
    fontFamily: Styles.PrimaryFontRegular,
    fontWeight: Styles.primaryFontWeightSemiBold,
  );
  static final TextStyle SecondaryHeader = TextStyle(
    color: Styles.SubTextColor,
    fontSize: SizeConfig.blockSizeHorizontal! * 4,
    fontFamily: Styles.PrimaryFontRegular,
    fontWeight: Styles.primaryFontWeightLight,
  );
  static final TextStyle Header = TextStyle(
    color: Styles.TextColor,
    fontSize: SizeConfig.blockSizeHorizontal! * 4,
    fontFamily: Styles.PrimaryFontRegular,
    fontWeight: Styles.primaryFontWeightSemiBold,
  );
  static final TextStyle HomePrimaryHeader = TextStyle(
    color: Styles.TextColor,
    fontSize: SizeConfig.blockSizeHorizontal! * 4,
    fontFamily: Styles.PrimaryFontRegular,
    fontWeight: Styles.primaryFontWeightSemiBold,
  );
  static final TextStyle HomeSecondaryHeader = TextStyle(
    color: Styles.SubTextColor,
    fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
    fontFamily: Styles.PrimaryFontRegular,
    fontWeight: Styles.primaryFontWeightSemiBold,
  );
  static final TextStyle Tag = TextStyle(
    color: Styles.PrimaryColor,
    fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
    fontFamily: Styles.PrimaryFontRegular,
    fontWeight: Styles.primaryFontWeightSemiBold,
  );
}
