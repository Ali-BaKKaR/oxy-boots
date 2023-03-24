import 'package:flutter/cupertino.dart';
import 'package:oxyboots/models/brand.dart';
import 'package:oxyboots/repository/oxy_repo_interface.dart';

class SessionProvider extends ChangeNotifier {
  Future<List<Brand>> _brands;
  Future<List<Brand>> get brands => _brands;
  OxyRepoInterface oxyRepo;

  SessionProvider(this.oxyRepo) : _brands = oxyRepo.getBrands();

  refreshBrands() async {
    _brands = (await oxyRepo.getBrands()) as Future<List<Brand>>;
    notifyListeners();
  }
}
