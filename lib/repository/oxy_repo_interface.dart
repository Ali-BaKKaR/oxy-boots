import '../models/brand.dart';

abstract class OxyRepoInterface {
  Future<List<Brand>> getBrands();
}
