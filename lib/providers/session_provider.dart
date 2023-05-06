import 'package:flutter/cupertino.dart';
import 'package:oxyboots/models/brand.dart';
import 'package:oxyboots/repository/oxy_repo_interface.dart';

import '../models/shoes.dart';

class SessionProvider extends ChangeNotifier {
  Future<List<Brand>> _brands;
  Future<List<Brand>> get brands => _brands;
  Future<List<Shoes>> _shoes;
  Future<List<Shoes>> get shoes => _shoes;
  OxyRepoInterface oxyRepo;

  SessionProvider(this.oxyRepo)
      : _brands = oxyRepo.getBrands(),
        _shoes = oxyRepo.getShoes();

  refreshBrands() async {
    _brands = (await oxyRepo.getBrands()) as Future<List<Brand>>;
    notifyListeners();
  }
}
