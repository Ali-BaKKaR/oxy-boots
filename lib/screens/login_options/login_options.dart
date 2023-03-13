import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:oxyboots/component/ob_image_button.dart';
import 'package:oxyboots/component/ob_button.dart';
import 'package:oxyboots/component/ob_flat_button.dart';
import 'package:oxyboots/component/ob_input_text.dart';
import 'package:oxyboots/config/styles.dart';
import 'package:oxyboots/main.dart';
import 'package:oxyboots/screens/login_options/signup.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../config/size_config.dart';
import '../Intro/intro.dart';

class LoginOptions extends StatefulWidget {
  const LoginOptions({super.key});
  static const String routeName = './loginOptions';

  @override
  State<LoginOptions> createState() => _LoginOptionsState();
}

class _LoginOptionsState extends State<LoginOptions> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Scaffold(
        backgroundColor: Styles.FrameColor,
        appBar: AppBar(
            backgroundColor: Styles.FrameColor,
            elevation: 0,
            leading: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.blockSizeVertical! * 2),
              child: BackButton(
                onPressed: () =>
                    Navigator.of(context).popAndPushNamed(Intro.routeName),
                color: Styles.TextColor,
              ),
            )),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical! * 3),
          child: Column(children: [
            Center(
              child: Text(
                'Hello Again!',
                style: Styles.PrimaryHeader,
                textAlign: TextAlign.left,
              ),
            ),
            Center(
              child: Text(
                'Welcome Back You’ve Been Missed!',
                style: Styles.SecondaryHeader,
                textAlign: TextAlign.end,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  vertical: SizeConfig.blockSizeVertical! * 4,
                  horizontal: SizeConfig.blockSizeHorizontal! * 4),
              child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.blockSizeHorizontal! * 4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: EdgeInsets.symmetric(
                              vertical: SizeConfig.blockSizeVertical! * 2,
                            ),
                            child: Text(
                              'Email Address',
                              textAlign: TextAlign.start,
                              style: Styles.Header,
                            )),
                        const OBInputText(
                            'youremail@mail.com', Icon(Icons.mail)),
                        Container(
                            margin: EdgeInsets.symmetric(
                              vertical: SizeConfig.blockSizeVertical! * 2,
                            ),
                            child: Text(
                              'Password',
                              textAlign: TextAlign.start,
                              style: Styles.Header,
                            )),
                        const OBInputText('***********', Icon(Icons.lock)),
                        Container(
                          margin: EdgeInsets.symmetric(
                            vertical: SizeConfig.blockSizeVertical! * 4,
                          ),
                          child: OBButton(
                              const Text('Sgin In'),
                              onTap: _signinTapped,
                              true),
                        ),
                        OBFlatButton(
                            const OBImageButton(
                              'assets/images/github-logo.png',
                              'Sign in with github',
                            ),
                            _signinTapped)
                      ],
                    ),
                  )),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.symmetric(
                  vertical: SizeConfig.blockSizeVertical! * 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Don’t have an account?'),
                  TextButton(
                      onPressed: _signinTapped,
                      child: const Text(
                        'Sign Up for free',
                      ))
                ],
              ),
            ),
          ]),
        ));
  }

  void _signinTapped() {
    // NOTE we're simulating login here for now
    supabase.auth.signInWithOAuth(Provider.github,
        redirectTo: dotenv.env['SUPABASE_AUTH_CALLBACK']);
  }
}
