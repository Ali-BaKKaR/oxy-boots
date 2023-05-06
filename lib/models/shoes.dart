import 'package:json_annotation/json_annotation.dart';

part 'shoes.g.dart';

@JsonSerializable()
class Shoes {
  @JsonKey(name: 'id', required: true)
  int id;
  @JsonKey(name: 'name', required: true)
  String name;
  @JsonKey(name: 'image', required: true)
  String image;
  @JsonKey(name: 'price', required: true)
  double price;
  @JsonKey(name: 'tag', required: true)
  String tag;
  @JsonKey(name: 'brand', required: true)
  int brandId;
  @JsonKey(name: 'description', required: true)
  String description;

  Shoes(this.id, this.name, this.image, this.price, this.tag, this.brandId,
      this.description);

  factory Shoes.fromJson(Map<String, dynamic> json) => _$ShoesFromJson(json);
  Map<String, dynamic> toJson() => _$ShoesToJson(this);
}
