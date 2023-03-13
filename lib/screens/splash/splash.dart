import 'package:flutter/material.dart';
import 'package:oxyboots/main.dart';
import 'package:oxyboots/screens/login_options/login_options.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '/screens/intro/intro.dart';

class Splash extends StatefulWidget {
  static const routeName = '/';

  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => SplashState();
}

class SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (session != null) {
      return LoginOptions();
    } else if (session == null) {
      return LoginOptions();
    } else
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
  }
}
