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
    notifyListeners();
  }

  increament(Shoes shoes) {
    _cartShoesList[shoes] = _cartShoesList[shoes]! + 1;
    refreshSuptotal();
    notifyListeners();
  }

  reduction(Shoes shoes) {
    if (_cartShoesList[shoes]! > 1) {
      _cartShoesList[shoes] = _cartShoesList[shoes]! - 1;
      refreshSuptotal();
      notifyListeners();
    }
  }

  remove(Shoes shoes) {
    _cartShoesList.remove(shoes);
    notifyListeners();
  }

  refreshSuptotal() {
    for (var i = 0; i < _cartShoesList.values.length; i++) {
      _subtotal = subtotal + _cartShoesList.keys.elementAt(i).price;
      print(_subtotal);
    }
  }
}
