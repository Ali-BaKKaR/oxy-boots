import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oxyboots/config/size_config.dart';
import 'package:oxyboots/config/styles.dart';
import 'package:oxyboots/screens/Home/home.dart';
import 'package:oxyboots/screens/cart/cart.dart';
import 'package:oxyboots/screens/favourites/favourites.dart';
import 'package:oxyboots/screens/login_options/login_options.dart';
import 'package:oxyboots/screens/notifications/notifications_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Styles.TextColor,
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[buildHeader(context), buildMenuItems(context)],
      )),
    );
  }

  Widget buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: 32, top: SizeConfig.blockSizeVertical! * 8, bottom: 10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        CircleAvatar(
            radius: 52,
            backgroundColor: Styles.BGColor,
            backgroundImage: const NetworkImage(
                'https://media.licdn.com/dms/image/C4D03AQGHftqSJBVcxQ/profile-displayphoto-shrink_800_800/0/1661010056650?e=2147483647&v=beta&t=-UGC9QtcRmgvBl6vkfsKzN4WhBKKMp1_9XwvfLxoBWY')),
        Text(
          'Hey, 👋',
          style: Styles.SecondaryHeader.copyWith(
              fontSize: SizeConfig.blockSizeHorizontal! * 4, height: 2),
        ),
        Text('Ali Bakkar',
            style: Styles.Header.copyWith(
                color: Styles.BGColor,
                fontSize: SizeConfig.blockSizeHorizontal! * 5,
                height: 2)),
      ]),
    );
  }

  Widget buildMenuItems(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Wrap(
        runSpacing: 12,
        children: [
          ListTile(
            leading: Icon(
              Icons.person_outline,
              color: Styles.SubTextColor,
            ),
            title: Text('Profile',
                style: Styles.Header.copyWith(
                  color: Styles.BGColor,
                )),
            onTap: () {},
          ),
          ListTile(
            leading: SvgPicture.asset(
              'assets/icons/home.svg',
              color: Styles.SubTextColor,
            ),
            title: Text('Home Page',
                style: Styles.Header.copyWith(
                  color: Styles.BGColor,
                )),
            onTap: () {
              Navigator.of(context).pushNamed(Home.routeName);
            },
          ),
          ListTile(
            leading: SvgPicture.asset(
              'assets/icons/menu-white.svg',
              color: Styles.SubTextColor,
            ),
            title: Text('My Cart',
                style: Styles.Header.copyWith(
                  color: Styles.BGColor,
                )),
            onTap: () {
              Navigator.of(context).pushNamed(Cart.routeName);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.favorite_border,
              color: Styles.SubTextColor,
            ),
            title: Text('Favourites',
                style: Styles.Header.copyWith(
                  color: Styles.BGColor,
                )),
            onTap: () {
              Navigator.of(context).pushNamed(Favourites.routeName);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.notifications_none,
              color: Styles.SubTextColor,
            ),
            title: Text('Notifications',
                style: Styles.Header.copyWith(
                  color: Styles.BGColor,
                )),
            onTap: () {
              Navigator.of(context).pushNamed(NotificationsScreen.routeName);
            },
          ),
          Divider(
            color: Styles.SubTextColor,
            endIndent: 50,
            indent: 40,
          ),
          ListTile(
            leading: Icon(
              Icons.logout,
              color: Styles.SubTextColor,
            ),
            title: Text('Sign Out',
                style: Styles.Header.copyWith(
                  color: Styles.BGColor,
                )),
            onTap: () {
              Supabase.instance.client.auth.signOut();
              Navigator.of(context).pushNamedAndRemoveUntil(
                  LoginOptions.routeName, (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
