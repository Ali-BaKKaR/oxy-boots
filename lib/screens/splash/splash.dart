import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../Home/home.dart';
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
    if (Supabase.instance.client.auth.currentSession != null) {
      return const Home();
    } else if (Supabase.instance.client.auth.currentSession == null) {
      return const Intro();
    } else {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
  }
}
