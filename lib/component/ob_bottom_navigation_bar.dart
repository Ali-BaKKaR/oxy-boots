import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oxyboots/screens/login_options/login_options.dart';

import '../config/styles.dart';
import '../screens/Home/home.dart';

class OBBottomNavigationBar extends StatefulWidget {
  const OBBottomNavigationBar({super.key});

  @override
  State<OBBottomNavigationBar> createState() => OBBottomNavigationBarState();
}

class OBBottomNavigationBarState extends State<OBBottomNavigationBar> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 10,
      child: Container(
          padding: EdgeInsets.only(left: 30, right: 30),
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => {
                  index = 0,
                  Navigator.of(context).pushNamed(
                    Home.routeName,
                  )
                },
                icon: SvgPicture.asset(
                  'assets/icons/home.svg',
                  width: 23,
                  color: index == 0 ? Styles.PrimaryColor : Styles.TextColor,
                ),
              ),
              IconButton(
                onPressed: () => {
                  index = 1,
                  Navigator.of(context).pushNamed(
                    LoginOptions.routeName,
                  )
                },
                icon: SvgPicture.asset(
                  'assets/icons/heart.svg',
                  width: 23,
                  color: index == 1 ? Styles.PrimaryColor : Styles.TextColor,
                ),
              ),
              IconButton(
                onPressed: () => {
                  index = 2,
                  Navigator.of(context).pushNamed(
                    LoginOptions.routeName,
                  )
                },
                icon: SvgPicture.asset(
                  'assets/icons/notification.svg',
                  width: 23,
                  color: index == 2 ? Styles.PrimaryColor : Styles.TextColor,
                ),
              ),
              IconButton(
                onPressed: () => {
                  index = 3,
                  Navigator.of(context).pushNamed(
                    LoginOptions.routeName,
                  )
                },
                icon: SvgPicture.asset(
                  'assets/icons/user.svg',
                  width: 23,
                  color: index == 3 ? Styles.PrimaryColor : Styles.TextColor,
                ),
              )
            ],
          )),
    );
  }
}
