import 'package:flutter/material.dart';

import '../config/styles.dart';

class OBInputText extends StatelessWidget {
  final String hint;
  final Icon icon;
  const OBInputText(this.hint, this.icon, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          prefixIcon: icon,
          hintText: hint,
          filled: true,
          fillColor: Styles.BGColor,
          enabledBorder: myinputborder(),
          focusedBorder: myfocusborder()),
    );
  }

  OutlineInputBorder myinputborder() {
    //return type is OutlineInputBorder
    return OutlineInputBorder(
        //Outline border type for TextFeild
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        borderSide: BorderSide(
          color: Styles.BGColor,
          width: 1,
        ));
  }

  OutlineInputBorder myfocusborder() {
    return OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        borderSide: BorderSide(
          color: Styles.PrimaryColor,
          width: 1,
        ));
  }
}
