import 'package:flutter/material.dart';
import 'package:oxyboots/models/shoes.dart';
import 'package:oxyboots/screens/shoes_details/shoes_details.dart';

import '../../config/size_config.dart';
import '../../config/styles.dart';

class ShoesItem extends StatelessWidget {
  final Shoes shoesItem;
  const ShoesItem({Key? key, required this.shoesItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Styles.BGColor, borderRadius: BorderRadius.circular(16)),
        child: Stack(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ShoesDetails(
                              shoes: shoesItem,
                            )));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                        vertical: SizeConfig.blockSizeVertical! * 0.5),
                    child: Image.network(
                      shoesItem.image,
                      width: SizeConfig.blockSizeHorizontal! * 43,
                      colorBlendMode: BlendMode.colorBurn,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: SizeConfig.blockSizeHorizontal! * 4),
                    child: Text(
                      shoesItem.tag,
                      style: Styles.Tag,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: SizeConfig.blockSizeHorizontal! * 4),
                    child: Text(shoesItem.name, style: Styles.Header),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: SizeConfig.blockSizeHorizontal! * 4,
                        bottom: SizeConfig.blockSizeHorizontal! * 4),
                    child: Text('\$' + shoesItem.price.toString(),
                        style: Styles.Header),
                  ),
                ],
              ),
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
                        borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(16),
                            topLeft: Radius.circular(16))),
                    child: Icon(
                      Icons.add,
                      color: Styles.BGColor,
                    ),
                  )),
            )
          ],
        ));
  }
}
