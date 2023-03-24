import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oxyboots/component/ob_input_text.dart';
import 'package:oxyboots/providers/session_provider.dart';
import 'package:provider/provider.dart';

import '../../config/size_config.dart';
import '../../config/styles.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int i = 0;
  late List<bool> x;
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Styles.FrameColor,
          elevation: 0,
          leading: IconButton(
            icon: SvgPicture.asset('assets/icons/menu.svg'),
            onPressed: () {},
            color: Styles.TextColor,
          ),
          title: Column(
            children: [
              Text(
                'Store location',
                style: Styles.HomeSecondaryHeader,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_on_rounded,
                    color: Styles.ActionColor,
                  ),
                  Text('Mondolibug, Sylhet', style: Styles.HomePrimaryHeader),
                ],
              ),
            ],
          ),
          centerTitle: true,
          actions: [
            IconButton(
              style: IconButton.styleFrom(backgroundColor: Styles.ActionColor),
              hoverColor: Styles.ActionColor,
              onPressed: () {},
              icon: SvgPicture.asset('assets/icons/cart.svg'),
              color: Styles.TextColor,
            )
          ],
        ),
        body: Consumer<SessionProvider>(
          builder: (context, session, child) {
            return SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.blockSizeVertical! * 3,
                      horizontal: SizeConfig.blockSizeHorizontal! * 4),
                  child: Column(
                    children: [
                      const OBInputText(
                          'Looking for shoes', Icon(Icons.search)),
                      SizedBox(
                          height: 110,
                          child: FutureBuilder(
                            future: session.brands,
                            builder: (context, snapshot) {
                              if (snapshot.data == null) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              return ListView.builder(
                                itemCount: snapshot.data!.length,
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: EdgeInsets.only(
                                      top: 10,
                                      left: index == 0 ? 0 : 0,
                                      right: index == 10 ? 0 : 8,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(6),
                                          decoration: BoxDecoration(
                                              color: i % 2 == 0
                                                  ? Styles.PrimaryColor
                                                  : null,
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(50))),
                                          child: Row(
                                            children: [
                                              CircleAvatar(
                                                backgroundColor: Styles.BGColor,
                                                maxRadius: 22,
                                                foregroundImage: NetworkImage(
                                                    snapshot.data![index].logo),
                                              ),
                                              i % 2 == 0
                                                  ? Container(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 8),
                                                      child: Text(
                                                        snapshot
                                                            .data![index].name,
                                                        style: TextStyle(
                                                            color:
                                                                Styles.BGColor,
                                                            fontWeight: Styles
                                                                .primaryFontWeightSemiBold),
                                                      ),
                                                    )
                                                  : Container()
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          )),
                      ElevatedButton(onPressed: t, child: Text(i.toString())),
                      i % 2 == 0 ? const Text('even') : const Text('Odd')
                    ],
                  )),
            );
          },
        ));
  }

  void t() {
    setState(() {
      i++;
    });
  }
}
