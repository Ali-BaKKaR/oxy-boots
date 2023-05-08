import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oxyboots/component/ob_bottom_navigation_bar.dart';
import 'package:oxyboots/component/ob_input_text.dart';
import 'package:oxyboots/providers/session_provider.dart';
import 'package:oxyboots/screens/Home/brand_item.dart';
import 'package:oxyboots/screens/Home/shoes_item.dart';
import 'package:provider/provider.dart';

import '../../config/size_config.dart';
import '../../config/styles.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  static const String routeName = './home';

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
                              itemCount: snapshot.data!.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return ShoesItem(
                                    shoesItem: snapshot.data![index]);
                              },
                            ),
                          );
                        }),
                    Container(
                      margin: EdgeInsets.symmetric(
                          vertical: SizeConfig.blockSizeVertical! * 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'New Arrival',
                            style: Styles.Header,
                          ),
                          GestureDetector(
                            onTap: () => {},
                            child: Text(
                              'See all',
                              style: TextStyle(color: Styles.PrimaryColor),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Styles.BGColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      SizeConfig.blockSizeHorizontal! * 2),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'BEST CHOICE',
                                    style:
                                        Styles.Tag.copyWith(letterSpacing: 2),
                                  ),
                                  Text(
                                    'Nike Air Jordan',
                                    style: Styles.Header.copyWith(
                                        fontSize:
                                            SizeConfig.blockSizeHorizontal! *
                                                5),
                                  ),
                                  Text(
                                    '\$894.99',
                                    style: Styles.Header,
                                  )
                                ],
                              ),
                            ),
                            Image.network(
                                width: SizeConfig.blockSizeHorizontal! * 50,
                                'https://rnkchlevztswclogwyon.supabase.co/storage/v1/object/public/shoes/PngItem_5550642%20(2)%202.png?t=2023-05-06T10%3A35%3A34.533Z')
                          ]),
                    )
                  ])),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Styles.PrimaryColor,
          onPressed: () {},
          child: SvgPicture.asset('assets/icons/menu-white.svg'),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: OBBottomNavigationBar());
  }
}
