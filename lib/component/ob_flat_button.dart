import 'package:flutter/material.dart';

import '../config/size_config.dart';
import '../config/styles.dart';

class OBFlatButton extends StatelessWidget {
  final Widget child;
  final GestureTapCallback? onTap;

  const OBFlatButton(
    this.child,
    this.onTap, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            foregroundColor: Styles.TextColor,
            backgroundColor: Styles.BGColor,
            elevation: 0,
            textStyle: TextStyle(
              fontFamily: Styles.PrimaryFontRegular,
              fontWeight: Styles.primaryFontWeightLight,
              fontSize: SizeConfig.blockSizeHorizontal! * 4,
            ),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(50)))),
        onPressed: onTap,
        child: child);
  }
}
