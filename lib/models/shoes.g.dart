// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shoes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Shoes _$ShoesFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const [
      'id',
      'name',
      'image',
      'price',
      'tag',
      'brand',
      'description'
    ],
  );
  return Shoes(
    json['id'] as int,
    json['name'] as String,
    json['image'] as String,
    (json['price'] as num).toDouble(),
    json['tag'] as String,
    json['brand'] as int,
    json['description'] as String,
  );
}

Map<String, dynamic> _$ShoesToJson(Shoes instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'price': instance.price,
      'tag': instance.tag,
      'brand': instance.brandId,
      'description': instance.description,
    };
