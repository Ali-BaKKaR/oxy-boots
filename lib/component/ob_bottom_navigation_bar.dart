import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oxyboots/screens/favourites/favourites.dart';
import 'package:oxyboots/screens/notifications/notifications_screen.dart';

import '../config/styles.dart';
import '../screens/Home/home.dart';

class OBBottomNavigationBar extends StatefulWidget {
  const OBBottomNavigationBar({super.key});

  @override
  State<OBBottomNavigationBar> createState() => OBBottomNavigationBarState();
}

class OBBottomNavigationBarState extends State<OBBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    String currentRouteName;
    if (ModalRoute.of(context)?.settings.name != '/') {
      currentRouteName = ModalRoute.of(context)!.settings.name!;
    } else {
      currentRouteName = './home';
    }
    return Container(
        color: Styles.BGColor,
        padding: EdgeInsets.only(left: 30, right: 30),
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () => {
                Navigator.of(context).pushNamed(
                  Home.routeName,
                )
              },
              icon: SvgPicture.asset(
                'assets/icons/home.svg',
                width: 30,
                color: currentRouteName == './home'
                    ? Styles.PrimaryColor
                    : Styles.TextColor,
              ),
            ),
            IconButton(
              onPressed: () => {
                Navigator.of(context).pushNamed(
                  Favourites.routeName,
                )
              },
              icon: Icon(
                Icons.favorite_border,
                size: 30,
                color: currentRouteName == './favourites'
                    ? Styles.PrimaryColor
                    : Styles.TextColor,
              ),
            ),
            Container(
              height: 0,
            ),
            IconButton(
              onPressed: () => {
                Navigator.of(context).pushNamed(
                  NotificationsScreen.routeName,
                )
              },
              icon: Icon(
                Icons.notifications_none,
                size: 30,
                color: currentRouteName == './NotificationsScreen'
                    ? Styles.PrimaryColor
                    : Styles.TextColor,
              ),
            ),
            IconButton(
              onPressed: () => {
                Navigator.of(context).pushNamed(
                  Favourites.routeName,
                )
              },
              icon: Icon(
                Icons.person_outline,
                size: 30,
                color: currentRouteName == './user'
                    ? Styles.PrimaryColor
                    : Styles.TextColor,
              ),
            )
          ],
        ));
  }
}
