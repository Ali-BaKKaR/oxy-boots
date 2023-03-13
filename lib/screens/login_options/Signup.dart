import 'package:flutter/material.dart';

import '../../component/ob_image_button.dart';
import '../../component/ob_button.dart';
import '../../component/ob_flat_button.dart';
import '../../component/ob_input_text.dart';
import '../../config/size_config.dart';
import '../../config/styles.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});
  static const String routeName = './signup';

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
        backgroundColor: Styles.FrameColor,
        appBar: AppBar(
            backgroundColor: Styles.FrameColor,
            elevation: 0,
            leading: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: SizeConfig.blockSizeVertical! * 2),
              child: BackButton(
                onPressed: () => Navigator.of(context).pop(Signup.routeName),
                color: Styles.TextColor,
              ),
            )),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(top: SizeConfig.blockSizeVertical! * 3),
          child: Column(children: [
            Center(
              child: Text(
                'Create Account!',
                style: Styles.PrimaryHeader,
                textAlign: TextAlign.left,
              ),
            ),
            Center(
              child: Text(
                'Let’s Create Account Together',
                style: Styles.SecondaryHeader,
                textAlign: TextAlign.end,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  vertical: SizeConfig.blockSizeVertical! * 4,
                  horizontal: SizeConfig.blockSizeHorizontal! * 4),
              child: Form(
                  key: formKey,
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
                              'Your Name',
                              textAlign: TextAlign.start,
                              style: Styles.Header,
                            )),
                        const OBInputText('Ali Bakkar', Icon(Icons.person)),
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
                              const Text('Sgin Up'),
                              onTap: _signinTapped,
                              true),
                        ),
                        OBFlatButton(
                            const OBImageButton(
                              'assets/images/github-logo.png',
                              'Sign up with github',
                            ),
                            _signinTapped)
                      ],
                    ),
                  )),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.symmetric(
                  vertical: SizeConfig.blockSizeVertical! * 4),
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
            )
          ]),
        ));
  }

  void _signinTapped() {
    // NOTE we're simulating login here for now

    Navigator.of(context).pushNamed(Signup.routeName);
  }
}
