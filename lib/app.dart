import 'package:flutter/material.dart';
import 'package:oxyboots/screens/login_options/signup.dart';
import 'package:oxyboots/screens/login_options/login_options.dart';
import 'package:oxyboots/screens/splash/splash.dart';

import 'screens/Intro/intro.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Splash.routeName,
      routes: {
        Splash.routeName: (context) => const Splash(),
        Intro.routeName: (context) => const Intro(),
        LoginOptions.routeName: (context) => const LoginOptions(),
        Signup.routeName: (context) => const Signup()
      },
    );
  }
}
