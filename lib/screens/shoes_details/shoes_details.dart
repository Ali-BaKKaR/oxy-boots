import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oxyboots/component/ob_button.dart';

import '../../config/size_config.dart';
import '../../config/styles.dart';
import '../../models/shoes.dart';

class ShoesDetails extends StatefulWidget {
  final Shoes shoes;
  ShoesDetails({required this.shoes, Key? key}) : super(key: key);

  @override
  State<ShoesDetails> createState() => _ShoesDetailsState();
}

class _ShoesDetailsState extends State<ShoesDetails> {
  int size = 37;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

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
            "Men's Shoes",
            style: Styles.Header,
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/icons/cart.svg'),
              color: Styles.TextColor,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 30,
              child: Stack(
                children: [
                  Positioned(
                      right: 0,
                      left: 0,
                      bottom: 40,
                      child: Image.asset(
                        'assets/images/details-line.png',
                      )),
                  Image.network(
                    widget.shoes.image,
                    height: 250,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.blockSizeHorizontal! * 6,
                  vertical: SizeConfig.blockSizeVertical! * 1),
              width: SizeConfig.blockSizeHorizontal! * 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Styles.BGColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    widget.shoes.tag,
                    style: Styles.Tag.copyWith(
                        fontSize: SizeConfig.blockSizeHorizontal! * 5),
                  ),
                  Text(
                    widget.shoes.name,
                    style: Styles.Header.copyWith(
                        height: 2,
                        fontSize: SizeConfig.blockSizeHorizontal! * 6),
                  ),
                  Text(
                    '\$${widget.shoes.price}',
                    textAlign: TextAlign.left,
                    style: Styles.Header.copyWith(
                        fontSize: SizeConfig.blockSizeHorizontal! * 5.5),
                  ),
                  Text(
                    widget.shoes.description,
                    style: Styles.HomeSecondaryHeader.copyWith(
                        height: 2,
                        fontSize: SizeConfig.blockSizeHorizontal! * 4,
                        fontWeight: Styles.primaryFontWeightLight),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.blockSizeVertical! * 2),
                    child: Text('Gallery',
                        style: Styles.Header.copyWith(
                          fontSize: SizeConfig.blockSizeHorizontal! * 5,
                        )),
                  ),
                  SizedBox(
                    height: 60,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        itemCount: 3,
                        itemBuilder: (context, index) => Container(
                              margin: EdgeInsets.only(
                                  left: SizeConfig.blockSizeHorizontal! * 2),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Styles.FrameColor),
                              child: Container(
                                  child: Image.network(widget.shoes.image)),
                            )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: SizeConfig.blockSizeVertical! * 2,
                        bottom: SizeConfig.blockSizeVertical! * 1),
                    child: Text('Size',
                        style: Styles.Header.copyWith(
                          fontSize: SizeConfig.blockSizeHorizontal! * 5,
                        )),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomRadioButton("38", 38),
                      CustomRadioButton("39", 39),
                      CustomRadioButton("40", 40),
                      CustomRadioButton("41", 41),
                      CustomRadioButton("42", 42),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Price',
                              style: Styles.SecondaryHeader.copyWith(
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal! * 5),
                            ),
                            Text(
                              '\$${widget.shoes.price}',
                              style: Styles.Header.copyWith(
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal! * 5.5),
                            )
                          ],
                        ),
                        OBButton(
                          Text('Add To Cart'),
                          false,
                          onTap: () {},
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ]),
        ));
  }

  Widget CustomRadioButton(String text, int index) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
          backgroundColor:
              (size == index) ? Styles.PrimaryColor : Styles.FrameColor,
          shape: CircleBorder(),
          side: BorderSide(
            color: Colors.transparent,
          ),
          padding: EdgeInsets.all(10)),
      onPressed: () {
        setState(() {
          size = index;
        });
      },
      child: Text(
        text,
        style: Styles.SecondaryHeader.copyWith(
          fontSize: 20,
          color: (size == index) ? Styles.BGColor : Styles.SubTextColor,
        ),
      ),
    );
  }
}
