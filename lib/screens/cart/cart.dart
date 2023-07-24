import 'package:flutter/material.dart';
import 'package:oxyboots/component/ob_button.dart';
import 'package:oxyboots/config/size_config.dart';
import 'package:provider/provider.dart';

import '../../config/styles.dart';
import '../../providers/session_provider.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});
  static const String routeName = './cart';

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
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
            "My Cart",
            style: Styles.Header,
          ),
          centerTitle: true,
        ),
        body: Consumer<SessionProvider>(
          builder: (context, session, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: session.cartShoesList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.blockSizeHorizontal! * 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                      left: 0, right: 8, top: 8, bottom: 8),
                                  width: SizeConfig.blockSizeHorizontal! * 30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Styles.BGColor),
                                  child: Image.network(session
                                      .cartShoesList.keys
                                      .elementAt(index)
                                      .image),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      session.cartShoesList.keys
                                          .elementAt(index)
                                          .name,
                                      style: Styles.Header,
                                    ),
                                    Text(
                                      '`\$${session.cartShoesList.keys.elementAt(index).price}',
                                      style: Styles.Header.copyWith(
                                          fontSize:
                                              SizeConfig.blockSizeHorizontal! *
                                                  3),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 5),
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                            backgroundColor: Styles.BGColor,
                                            radius: 16,
                                            child: IconButton(
                                                onPressed: () {
                                                  session.reduction(session
                                                      .cartShoesList.keys
                                                      .elementAt(index));
                                                },
                                                icon: Icon(Icons.remove),
                                                splashRadius: 20,
                                                iconSize: 16,
                                                color: Styles.PrimaryColor),
                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: SizeConfig
                                                        .blockSizeHorizontal! *
                                                    3),
                                            child: Text(
                                              session.cartShoesList.values
                                                  .elementAt(index)
                                                  .toString(),
                                              style: Styles.Header.copyWith(
                                                  fontSize: SizeConfig
                                                          .blockSizeHorizontal! *
                                                      4),
                                            ),
                                          ),
                                          CircleAvatar(
                                            backgroundColor:
                                                Styles.PrimaryColor,
                                            radius: 16,
                                            child: IconButton(
                                                onPressed: () {
                                                  session.increament(session
                                                      .cartShoesList.keys
                                                      .elementAt(index));
                                                },
                                                icon: Icon(Icons.add),
                                                splashRadius: 20,
                                                iconSize: 16,
                                                color: Styles.BGColor),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: () {
                                session.remove(session.cartShoesList.keys
                                    .elementAt(index));
                              },
                              icon: Icon(Icons.delete_outlined),
                              color: Styles.ActionColor,
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Styles.BGColor,
                  ),
                  padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.blockSizeVertical! * 2,
                      horizontal: SizeConfig.blockSizeHorizontal! * 4),
                  child: Column(
                    children: [
                      Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.blockSizeHorizontal! * 3,
                              vertical: SizeConfig.blockSizeVertical! * 0.5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Subtotal',
                                style: Styles.SecondaryHeader.copyWith(
                                    fontSize: 18),
                              ),
                              Text(
                                '\$${session.subtotal}',
                                style: Styles.Header.copyWith(fontSize: 20),
                              )
                            ],
                          )),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.blockSizeHorizontal! * 3,
                            vertical: SizeConfig.blockSizeVertical! * 0.5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Shipping',
                              style:
                                  Styles.SecondaryHeader.copyWith(fontSize: 18),
                            ),
                            Text(
                              '\$40.90',
                              style: Styles.Header.copyWith(fontSize: 20),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.blockSizeHorizontal! * 3,
                            vertical: SizeConfig.blockSizeVertical! * 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total Cost',
                              style:
                                  Styles.SecondaryHeader.copyWith(fontSize: 20),
                            ),
                            Text(
                              '\$${session.subtotal + 40}',
                              style: Styles.Header.copyWith(fontSize: 22),
                            )
                          ],
                        ),
                      ),
                      OBButton(Text('Checkout'), true, onTap: () {
                        final snackBar = SnackBar(
                          content: const Text('Yay! A SnackBar!'),
                          action: SnackBarAction(
                            label: 'Undo',
                            onPressed: () {
                              // Some code to undo the change.
                            },
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ],
            );
          },
        ));
  }
}
