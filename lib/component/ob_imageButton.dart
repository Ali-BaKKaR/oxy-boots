import 'package:flutter/material.dart';
import 'package:oxyboots/config/styles.dart';

class OBImageButton extends StatelessWidget {
  final String imageName;
  final String text;
  const OBImageButton(this.imageName, this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
            padding: const EdgeInsets.fromLTRB(0, 10.0, 20.0, 10.0),
            child: Image.asset(imageName, height: 40.0)),
        Text(
          text,
          style: Styles.Header,
        )
      ],
    );
  }
}
