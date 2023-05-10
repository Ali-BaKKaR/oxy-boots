import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});
  static const String routeName = './cart';

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('CART')),
    );
  }
}
