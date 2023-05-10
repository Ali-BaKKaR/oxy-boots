import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oxyboots/component/ob_bottom_navigation_bar.dart';
import 'package:oxyboots/config/size_config.dart';
import 'package:provider/provider.dart';

import '../../config/styles.dart';
import '../../providers/session_provider.dart';
import '../Home/shoes_item.dart';
import '../cart/cart.dart';

class Favourites extends StatelessWidget {
  const Favourites({super.key});
  static const String routeName = './favourites';

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
            "Favourites",
            style: Styles.Header,
          ),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Styles.PrimaryColor,
          onPressed: () {
            Navigator.of(context).pushNamed(Cart.routeName);
          },
          child: SvgPicture.asset('assets/icons/menu-white.svg'),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: OBBottomNavigationBar(),
        body: Consumer<SessionProvider>(builder: (context, session, child) {
          return SingleChildScrollView(
              child: Column(
            children: [
              FutureBuilder(
                future: session.shoesList,
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    return const Center(child: LinearProgressIndicator());
                  }

                  return SizedBox(
                      height: SizeConfig.blockSizeVertical! * 83,
                      width: SizeConfig.blockSizeHorizontal! * 100,
                      child: GridView.builder(
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.blockSizeHorizontal! * 3),
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent:
                              SizeConfig.blockSizeHorizontal! * 45,
                          mainAxisExtent: SizeConfig.blockSizeVertical! * 25,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                        ),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return ShoesItem(shoesItem: snapshot.data![index]);
                        },
                      ));
                },
              ),
            ],
          ));
        }));
  }
}
