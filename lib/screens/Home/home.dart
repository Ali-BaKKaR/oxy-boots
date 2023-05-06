import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oxyboots/component/ob_input_text.dart';
import 'package:oxyboots/providers/session_provider.dart';
import 'package:oxyboots/screens/Home/brand_item.dart';
import 'package:provider/provider.dart';

import '../../config/size_config.dart';
import '../../config/styles.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                      vertical: SizeConfig.blockSizeVertical! * 1,
                      horizontal: SizeConfig.blockSizeHorizontal! * 4),
                  child: Column(children: [
                    const OBInputText('Looking for shoes', Icon(Icons.search)),
                    FutureBuilder(
                        future: session.brands,
                        builder: (context, snapshot) {
                          if (snapshot.data == null) {
                            return const Center(
                                child: LinearProgressIndicator());
                          }
                          return Column(
                            children: [
                              SizedBox(
                                  height: 70,
                                  child: ListView.builder(
                                      itemCount: snapshot.data!.length,
                                      physics: const BouncingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return BrandItem(
                                          brandItem: snapshot.data![index],
                                          isSelected: true,
                                        );
                                      })),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    vertical:
                                        SizeConfig.blockSizeVertical! * 2),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Popular Shoes',
                                      style: Styles.Header,
                                    ),
                                    GestureDetector(
                                      onTap: () => {},
                                      child: Text(
                                        'See all',
                                        style: TextStyle(
                                            color: Styles.PrimaryColor),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              ////////////////////////////////////////////////////
                            ],
                          );
                        }),
                    FutureBuilder(
                        future: session.shoes,
                        builder: (context, snapshot) {
                          if (snapshot.data == null) {
                            return Container();
                          }
                          return SizedBox(
                            height: SizeConfig.blockSizeVertical! * 26,
                            child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              itemCount: 2,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Container(
                                    margin: EdgeInsets.only(
                                        right: SizeConfig.blockSizeHorizontal! *
                                            5),
                                    decoration: BoxDecoration(
                                        color: Styles.BGColor,
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    child: Stack(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: SizeConfig
                                                          .blockSizeVertical! *
                                                      1),
                                              child: Image.network(
                                                snapshot.data![index].image,
                                                width: SizeConfig
                                                        .blockSizeHorizontal! *
                                                    43,
                                                colorBlendMode:
                                                    BlendMode.colorBurn,
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: SizeConfig
                                                          .blockSizeHorizontal! *
                                                      4),
                                              child: Text(
                                                snapshot.data![index].tag,
                                                style: Styles.Tag,
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: SizeConfig
                                                          .blockSizeHorizontal! *
                                                      4),
                                              child: Text(
                                                  snapshot.data![index].name,
                                                  style: Styles.Header),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: SizeConfig
                                                          .blockSizeHorizontal! *
                                                      4,
                                                  bottom: SizeConfig
                                                          .blockSizeHorizontal! *
                                                      4),
                                              child: Text(
                                                  snapshot.data![index].price
                                                      .toString(),
                                                  style: Styles.Header),
                                            ),
                                          ],
                                        ),
                                        Positioned(
                                          width: 34,
                                          height: 35,
                                          bottom: 0,
                                          right: 0,
                                          child: GestureDetector(
                                              onTap: () {
                                                print('Add Shoees');
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: Styles.PrimaryColor,
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                            bottomRight:
                                                                Radius.circular(
                                                                    16),
                                                            topLeft:
                                                                Radius.circular(
                                                                    16))),
                                                child: Icon(
                                                  Icons.add,
                                                  color: Styles.BGColor,
                                                ),
                                              )),
                                        )
                                      ],
                                    ));
                              },
                            ),
                          );
                        })
                  ])),
            );
          },
        ));
  }
}
