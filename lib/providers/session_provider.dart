import 'package:flutter/cupertino.dart';
import 'package:oxyboots/models/brand.dart';
import 'package:oxyboots/repository/oxy_repo_interface.dart';

import '../models/shoes.dart';

class SessionProvider extends ChangeNotifier {
  Future<List<Brand>> _brands;
  Future<List<Brand>> get brands => _brands;
  Future<List<Shoes>> _shoesList;
  Future<List<Shoes>> get shoesList => _shoesList;
  Map<Shoes, int> _cartShoesList;
  Map<Shoes, int> get cartShoesList => _cartShoesList;
  double _subtotal;
  double get subtotal => _subtotal;
  OxyRepoInterface oxyRepo;

  SessionProvider(this.oxyRepo)
      : _brands = oxyRepo.getBrands(),
        _shoesList = oxyRepo.getShoesList(),
        _subtotal = 0,
        _cartShoesList = new Map();

  refreshBrands() async {
    _brands = (await oxyRepo.getBrands()) as Future<List<Brand>>;
    notifyListeners();
  }

  addShoesToCart(Shoes shoes) async {
    if (_cartShoesList[shoes] != null) {
      _cartShoesList[shoes] = _cartShoesList[shoes]! + 1;
    } else {
      _cartShoesList[shoes] = 1;
    }
    _subtotal = _subtotal + shoes.price;
    notifyListeners();
  }

  increament(Shoes shoes) {
    _cartShoesList[shoes] = _cartShoesList[shoes]! + 1;
    _subtotal = double.parse((_subtotal + shoes.price).toStringAsFixed(2));
    notifyListeners();
  }

  reduction(Shoes shoes) {
    if (_cartShoesList[shoes]! > 1) {
      _cartShoesList[shoes] = _cartShoesList[shoes]! - 1;
      _subtotal = _subtotal - shoes.price;
      notifyListeners();
    }
  }

  remove(Shoes shoes) {
    _cartShoesList.remove(shoes);
    _subtotal = _subtotal - shoes.price;
    notifyListeners();
  }
}
