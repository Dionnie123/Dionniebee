// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductDtoImpl _$$ProductDtoImplFromJson(Map<String, dynamic> json) =>
    _$ProductDtoImpl(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      excerpt: json['excerpt'] as String? ?? '',
      featuredImage: json['featured_image'] as String? ?? '',
      isSelected: json['is_selected'] as bool? ?? false,
      price: json['price'] as num? ?? 0,
      quantityInStock: json['quantity_in_stock'] as num? ?? 0,
      quantityInCart: json['quantity_in_cart'] as num? ?? 0,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$ProductDtoImplToJson(_$ProductDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'excerpt': instance.excerpt,
      'featured_image': instance.featuredImage,
      'is_selected': instance.isSelected,
      'price': instance.price,
      'quantity_in_stock': instance.quantityInStock,
      'quantity_in_cart': instance.quantityInCart,
      'created_at': instance.createdAt?.toIso8601String(),
    };
