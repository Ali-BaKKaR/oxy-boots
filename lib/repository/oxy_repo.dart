import 'package:oxyboots/models/brand.dart';
import 'package:oxyboots/models/shoes.dart';
import 'package:oxyboots/repository/oxy_repo_interface.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class OxyRepository implements OxyRepoInterface {
  const OxyRepository();

  @override
  Future<List<Brand>> getBrands() async {
    final resp =
        await Supabase.instance.client.from('brands').select('name , logo');
    return resp.map<Brand>((e) => Brand.fromJson(e)).toList();
  }

  Future<List<Shoes>> getShoesList() async {
    final resp = await Supabase.instance.client
        .from('shoes')
        .select('id,name,tag,price,description,brand,image');

    return resp.map<Shoes>((e) => Shoes.fromJson(e)).toList();
  }
}
