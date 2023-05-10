import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:oxyboots/providers/session_provider.dart';
import 'package:oxyboots/repository/oxy_repo.dart';
import 'package:oxyboots/repository/oxy_repo_interface.dart';
import 'package:oxyboots/screens/Home/home.dart';
import 'package:oxyboots/screens/cart/cart.dart';
import 'package:oxyboots/screens/favourites/favourites.dart';
import 'package:oxyboots/screens/login_options/signup.dart';
import 'package:oxyboots/screens/login_options/login_options.dart';
import 'package:oxyboots/screens/splash/splash.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'screens/Intro/intro.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Splash.routeName,
      routes: {
        Splash.routeName: (context) => const Splash(),
        Intro.routeName: (context) => const Intro(),
        LoginOptions.routeName: (context) => const LoginOptions(),
        Signup.routeName: (context) => const Signup(),
        Favourites.routeName: (context) => const Favourites(),
        Cart.routeName: (context) => const Cart(),
        Home.routeName: (context) => const Home()
      },
    );
  }
}

Future<void> runAppWithOptions(
    {String envFileName = '.env',
    OxyRepoInterface oxyRepository = const OxyRepository()}) async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');

  await Supabase.initialize(
      url: 'https://${dotenv.env['SUPABASE_PROJECT_ID']!}.supabase.co',
      anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
      debug: false);

  runApp(ChangeNotifierProvider(
      create: (context) => SessionProvider(oxyRepository), child: const App()));
}
