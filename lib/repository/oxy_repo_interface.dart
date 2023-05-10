import '../models/brand.dart';
import '../models/shoes.dart';

abstract class OxyRepoInterface {
  Future<List<Brand>> getBrands();
  Future<List<Shoes>> getShoesList();
  // Future<List<Shoes>> getShoes();
}
