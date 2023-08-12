// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductDto _$$_ProductDtoFromJson(Map<String, dynamic> json) =>
    _$_ProductDto(
      id: json['id'] as int?,
      imageUrl: json['image_url'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      price: json['price'] as num?,
      quantityInStock: json['quantity_in_stock'] as int?,
      quantityInCart: json['quantity_in_cart'] as int?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$_ProductDtoToJson(_$_ProductDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image_url': instance.imageUrl,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'quantity_in_stock': instance.quantityInStock,
      'quantity_in_cart': instance.quantityInCart,
      'created_at': instance.createdAt?.toIso8601String(),
    };
