import 'package:flutter/material.dart';

import '../../config/styles.dart';
import '../../models/brand.dart';

class BrandItem extends StatefulWidget {
  bool isSelected;
  final Brand brandItem;

  BrandItem({Key? key, required this.brandItem, required this.isSelected})
      : super(key: key);

  @override
  State<BrandItem> createState() => _BrandItemState();
}

class _BrandItemState extends State<BrandItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() {
        widget.isSelected = !widget.isSelected;
      }),
      child: Container(
          margin: const EdgeInsets.only(
            top: 10,
            left: 0,
            right: 10,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                    color: widget.isSelected ? Styles.PrimaryColor : null,
                    borderRadius: const BorderRadius.all(Radius.circular(50))),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Styles.BGColor,
                      maxRadius: 18,
                      foregroundImage: NetworkImage(widget.brandItem.logo),
                    ),
                    widget.isSelected
                        ? Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              widget.brandItem.name,
                              style: TextStyle(
                                  color: Styles.BGColor,
                                  fontWeight: Styles.primaryFontWeightSemiBold),
                            ),
                          )
                        : Container()
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
