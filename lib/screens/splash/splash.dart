// import 'package:flutter/material.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// import '../Home/home.dart';
// import '/screens/intro/intro.dart';

// class Splash extends StatefulWidget {
//   static const routeName = '/';

//   const Splash({Key? key}) : super(key: key);

//   @override
//   State<Splash> createState() => SplashState();
// }

// class SplashState extends State<Splash> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (Supabase.instance.client.auth.currentSession != null) {
//       return Home();
//     } else if (Supabase.instance.client.auth.currentSession == null) {
//       return const Intro();
//     } else {
//       return const Scaffold(
//         body: Center(child: CircularProgressIndicator()),
//       );
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:oxyboots/screens/Home/home.dart';
import 'package:oxyboots/screens/login_options/login_options.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Splash extends StatefulWidget {
  static const routeName = '/';
  const Splash({super.key});

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _redirect();
  }

  Future<void> _redirect() async {
    await Future.delayed(Duration.zero);
    if (!mounted) {
      return;
    }

    final session = Supabase.instance.client.auth.currentSession;
    if (session != null) {
      Navigator.of(context).pushReplacementNamed(Home.routeName);
    } else {
      Navigator.of(context).pushReplacementNamed(Intro.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
