import 'package:flutter/material.dart';
import 'package:oxyboots/component/ob_button.dart';
import 'package:oxyboots/config/styles.dart';
import 'package:oxyboots/config/size_config.dart';
import 'package:oxyboots/screens/login_options/login_options.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});
  static const String routeName = './intro';

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  static const String routeName = './intro';
  final _controller = PageController(initialPage: 0, keepPage: true);
  double _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    const List<String> _images = [
      'assets/images/shoes0.png',
      'assets/images/shoes1.png',
      'assets/images/shoes2.png'
    ];
    const List<String> _headersText = [
      'Start Journey With Nike',
      'Follow Latest Style Shoes',
      'Summer Shoes Nike 2022'
    ];
    const List<String> _content = [
      'Smart, Gorgeous & Fashionable Collection',
      'There Are Many Beautiful And Attractive Plants To Your Room',
      'Amet Minim Lit Nodeseru Saku Nandu sit Alique Dolor'
    ];

    SizeConfig.init(context);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
                controller: _controller,
                itemCount: 3,
                itemBuilder: (context, index) => Column(children: [
                      Container(
                          alignment: Alignment.topRight,
                          child: Image.asset(
                            'assets/images/Ellipse 906.png',
                          )),
                      Stack(
                        children: [
                          Image.asset(
                            'assets/images/NIKE.png',
                            // fit: BoxFit.contain,
                            alignment: Alignment.center,
                            width: SizeConfig.blockSizeHorizontal! * 100,
                            height: SizeConfig.blockSizeVertical! * 30,
                          ),
                          Image.asset(
                            _images[index],
                            fit: BoxFit.contain,
                            width: SizeConfig.blockSizeHorizontal! * 100,
                            height: SizeConfig.blockSizeVertical! * 30,
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: SizeConfig.blockSizeVertical! * 2,
                            horizontal: SizeConfig.blockSizeHorizontal! * 5),
                        child: Column(children: [
                          Text(
                            _headersText[index],
                            style: Styles.HOnBoard,
                          ),
                          Text(
                            _content[index],
                            style: Styles.COnBoard,
                          )
                        ]),
                      ),
                    ])),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(
                SizeConfig.blockSizeHorizontal! * 8,
                SizeConfig.blockSizeVertical! * 1,
                SizeConfig.blockSizeHorizontal! * 8,
                SizeConfig.blockSizeVertical! * 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: ExpandingDotsEffect(
                      dotColor: Styles.LineStock,
                      activeDotColor: Styles.PrimaryColor,
                      dotHeight: 5),
                ),
                // OBButton(onTap: () => _signupTapped(context), Text('Next')),
                OBButton(
                    _currentPage > 1.5
                        ? const Text('Get Started')
                        : const Text('Next'),
                    onTap: () => onAdd(),
                    false),
              ],
            ),
          )
        ],
      ),
    );
  }

  void onAdd() {
    _controller.page != 2
        ? _controller.nextPage(
            duration: const Duration(milliseconds: 300), curve: Curves.easeIn)
        : Navigator.of(context).pushNamed(LoginOptions.routeName);
  }

  Future _signupTapped(BuildContext context) async {
    // NOTE we're simulating login here for now

    Navigator.of(context).pushReplacementNamed(Intro.routeName);
  }
}
