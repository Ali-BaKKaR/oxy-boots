import 'package:flutter/material.dart';
import 'package:oxyboots/screens/login_options/signup.dart';
import 'package:oxyboots/screens/login_options/login_options.dart';

import 'screens/Intro/intro.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LoginOptions.routeName,
      routes: {
        Intro.routeName: (context) => const Intro(),
        LoginOptions.routeName: (context) => const LoginOptions(),
        Signup.routeName: (context) => const Signup()
      },
    );
  }
}
