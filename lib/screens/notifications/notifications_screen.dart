import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../component/ob_bottom_navigation_bar.dart';
import '../../config/size_config.dart';
import '../../config/styles.dart';
import '../cart/cart.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});
  static const String routeName = './NotificationsScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Styles.FrameColor,
          elevation: 0,
          leading: BackButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            color: Styles.TextColor,
          ),
          title: Text(
            "NotificationsScreen",
            style: Styles.Header,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.blockSizeHorizontal! * 4,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Today',
                  style: Styles.Header,
                ),
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.symmetric(
                            vertical: SizeConfig.blockSizeVertical! * 1),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Styles.BGColor,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Image.network(
                                    'https://rnkchlevztswclogwyon.supabase.co/storage/v1/object/public/shoes/nike-ah8050110-air_max_270-1-e_prev_ui%202.png',
                                    width: 100,
                                    height: 100),
                              ),
                              Column(
                                children: [
                                  Text(
                                    'We Have New\nProducts With Offers',
                                    style: Styles.Header.copyWith(
                                        fontSize:
                                            SizeConfig.blockSizeHorizontal! *
                                                3.5),
                                  ),
                                  Container(
                                    width: SizeConfig.blockSizeHorizontal! * 30,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('\$364.95',
                                            style: Styles.Header.copyWith(
                                              height: 2,
                                              fontSize: SizeConfig
                                                      .blockSizeHorizontal! *
                                                  3.5,
                                            )),
                                        Text('\$260.00',
                                            style:
                                                Styles.SecondaryHeader.copyWith(
                                              height: 2,
                                              fontSize: SizeConfig
                                                      .blockSizeHorizontal! *
                                                  3.5,
                                            ))
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Text('6 min ago',
                                      style: Styles.SecondaryHeader.copyWith(
                                        fontSize:
                                            SizeConfig.blockSizeHorizontal! *
                                                3.5,
                                      )),
                                  Container(
                                    margin: EdgeInsets.only(top: 15),
                                    width: 8,
                                    height: 8,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Styles.PrimaryColor),
                                        color: Styles.PrimaryColor,
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                  )
                                ],
                              )
                            ]),
                      );
                    }),
                Text(
                  'Earlier',
                  style: Styles.Header,
                ),
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.symmetric(
                            vertical: SizeConfig.blockSizeVertical! * 1),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Styles.BGColor,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Image.network(
                                    'https://rnkchlevztswclogwyon.supabase.co/storage/v1/object/public/shoes/nike-ah8050110-air_max_270-1-e_prev_ui%202.png',
                                    width: 100,
                                    height: 100),
                              ),
                              Column(
                                children: [
                                  Text(
                                    'We Have New\nProducts With Offers',
                                    style: Styles.Header.copyWith(
                                        fontSize:
                                            SizeConfig.blockSizeHorizontal! *
                                                3.5),
                                  ),
                                  Container(
                                    width: SizeConfig.blockSizeHorizontal! * 30,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('\$364.95',
                                            style: Styles.Header.copyWith(
                                              height: 2,
                                              fontSize: SizeConfig
                                                      .blockSizeHorizontal! *
                                                  3.5,
                                            )),
                                        Text('\$260.00',
                                            style:
                                                Styles.SecondaryHeader.copyWith(
                                              height: 2,
                                              fontSize: SizeConfig
                                                      .blockSizeHorizontal! *
                                                  3.5,
                                            ))
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Text('6 min ago',
                                      style: Styles.SecondaryHeader.copyWith(
                                        fontSize:
                                            SizeConfig.blockSizeHorizontal! *
                                                3.5,
                                      )),
                                  Container(
                                    margin: EdgeInsets.only(top: 15),
                                    width: 8,
                                    height: 8,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Styles.PrimaryColor),
                                        color: Styles.PrimaryColor,
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                  )
                                ],
                              )
                            ]),
                      );
                    }),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Styles.PrimaryColor,
          onPressed: () {
            Navigator.of(context).pushNamed(Cart.routeName);
          },
          child: SvgPicture.asset('assets/icons/menu-white.svg'),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: OBBottomNavigationBar());
  }
}
