// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductDtoImpl _$$ProductDtoImplFromJson(Map<String, dynamic> json) =>
    _$ProductDtoImpl(
      id: json['id'] as String?,
      isSelected: json['is_selected'] as bool? ?? false,
      imageUrl: json['image_url'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      price: json['price'] as num?,
      quantityInStock: json['quantity_in_stock'] as num?,
      quantityInCart: json['quantity_in_cart'] as num?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$ProductDtoImplToJson(_$ProductDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'is_selected': instance.isSelected,
      'image_url': instance.imageUrl,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'quantity_in_stock': instance.quantityInStock,
      'quantity_in_cart': instance.quantityInCart,
      'created_at': instance.createdAt?.toIso8601String(),
    };
