import 'package:flutter/material.dart';
import 'package:oxyboots/config/styles.dart';

import '../config/size_config.dart';

class OBButton extends StatelessWidget {
  final GestureTapCallback? onTap;
  final Widget child;
  final bool fullWidth;
  const OBButton(this.child, this.fullWidth, {Key? key, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          foregroundColor: Styles.BGColor,
          backgroundColor: Styles.PrimaryColor,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(50))),
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.blockSizeHorizontal! * 8,
              vertical: SizeConfig.blockSizeHorizontal! * 4),
          minimumSize: fullWidth
              ? Size.fromHeight(SizeConfig.blockSizeHorizontal! * 4)
              : null,
          textStyle: TextStyle(
            // color: Styles.BGColor,
            // backgroundColor: Styles.PrimaryColor,
            fontSize: SizeConfig.blockSizeHorizontal! * 5,
            fontFamily: Styles.PrimaryFontRegular,
            fontWeight: Styles.primaryFontWeightSemiBold,
          )),
      child: child,
    );
  }
}
