// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductDto _$ProductDtoFromJson(Map<String, dynamic> json) {
  return _ProductDto.fromJson(json);
}

/// @nodoc
mixin _$ProductDto {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get excerpt => throw _privateConstructorUsedError;
  String get featuredImage => throw _privateConstructorUsedError;
  bool get isSelected => throw _privateConstructorUsedError;
  num? get price => throw _privateConstructorUsedError;
  num? get quantityInStock => throw _privateConstructorUsedError;
  num? get quantityInCart => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductDtoCopyWith<ProductDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductDtoCopyWith<$Res> {
  factory $ProductDtoCopyWith(
          ProductDto value, $Res Function(ProductDto) then) =
      _$ProductDtoCopyWithImpl<$Res, ProductDto>;
  @useResult
  $Res call(
      {String id,
      String title,
      String excerpt,
      String featuredImage,
      bool isSelected,
      num? price,
      num? quantityInStock,
      num? quantityInCart,
      DateTime? createdAt});
}

/// @nodoc
class _$ProductDtoCopyWithImpl<$Res, $Val extends ProductDto>
    implements $ProductDtoCopyWith<$Res> {
  _$ProductDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? excerpt = null,
    Object? featuredImage = null,
    Object? isSelected = null,
    Object? price = freezed,
    Object? quantityInStock = freezed,
    Object? quantityInCart = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      excerpt: null == excerpt
          ? _value.excerpt
          : excerpt // ignore: cast_nullable_to_non_nullable
              as String,
      featuredImage: null == featuredImage
          ? _value.featuredImage
          : featuredImage // ignore: cast_nullable_to_non_nullable
              as String,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as num?,
      quantityInStock: freezed == quantityInStock
          ? _value.quantityInStock
          : quantityInStock // ignore: cast_nullable_to_non_nullable
              as num?,
      quantityInCart: freezed == quantityInCart
          ? _value.quantityInCart
          : quantityInCart // ignore: cast_nullable_to_non_nullable
              as num?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductDtoImplCopyWith<$Res>
    implements $ProductDtoCopyWith<$Res> {
  factory _$$ProductDtoImplCopyWith(
          _$ProductDtoImpl value, $Res Function(_$ProductDtoImpl) then) =
      __$$ProductDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String excerpt,
      String featuredImage,
      bool isSelected,
      num? price,
      num? quantityInStock,
      num? quantityInCart,
      DateTime? createdAt});
}

/// @nodoc
class __$$ProductDtoImplCopyWithImpl<$Res>
    extends _$ProductDtoCopyWithImpl<$Res, _$ProductDtoImpl>
    implements _$$ProductDtoImplCopyWith<$Res> {
  __$$ProductDtoImplCopyWithImpl(
      _$ProductDtoImpl _value, $Res Function(_$ProductDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? excerpt = null,
    Object? featuredImage = null,
    Object? isSelected = null,
    Object? price = freezed,
    Object? quantityInStock = freezed,
    Object? quantityInCart = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$ProductDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      excerpt: null == excerpt
          ? _value.excerpt
          : excerpt // ignore: cast_nullable_to_non_nullable
              as String,
      featuredImage: null == featuredImage
          ? _value.featuredImage
          : featuredImage // ignore: cast_nullable_to_non_nullable
              as String,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as num?,
      quantityInStock: freezed == quantityInStock
          ? _value.quantityInStock
          : quantityInStock // ignore: cast_nullable_to_non_nullable
              as num?,
      quantityInCart: freezed == quantityInCart
          ? _value.quantityInCart
          : quantityInCart // ignore: cast_nullable_to_non_nullable
              as num?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$ProductDtoImpl implements _ProductDto {
  _$ProductDtoImpl(
      {this.id = '',
      this.title = '',
      this.excerpt = '',
      this.featuredImage = '',
      this.isSelected = false,
      this.price = 0,
      this.quantityInStock = 0,
      this.quantityInCart = 0,
      this.createdAt});

  factory _$ProductDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductDtoImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String excerpt;
  @override
  @JsonKey()
  final String featuredImage;
  @override
  @JsonKey()
  final bool isSelected;
  @override
  @JsonKey()
  final num? price;
  @override
  @JsonKey()
  final num? quantityInStock;
  @override
  @JsonKey()
  final num? quantityInCart;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'ProductDto(id: $id, title: $title, excerpt: $excerpt, featuredImage: $featuredImage, isSelected: $isSelected, price: $price, quantityInStock: $quantityInStock, quantityInCart: $quantityInCart, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.excerpt, excerpt) || other.excerpt == excerpt) &&
            (identical(other.featuredImage, featuredImage) ||
                other.featuredImage == featuredImage) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.quantityInStock, quantityInStock) ||
                other.quantityInStock == quantityInStock) &&
            (identical(other.quantityInCart, quantityInCart) ||
                other.quantityInCart == quantityInCart) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      excerpt,
      featuredImage,
      isSelected,
      price,
      quantityInStock,
      quantityInCart,
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductDtoImplCopyWith<_$ProductDtoImpl> get copyWith =>
      __$$ProductDtoImplCopyWithImpl<_$ProductDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductDtoImplToJson(
      this,
    );
  }
}

abstract class _ProductDto implements ProductDto {
  factory _ProductDto(
      {final String id,
      final String title,
      final String excerpt,
      final String featuredImage,
      final bool isSelected,
      final num? price,
      final num? quantityInStock,
      final num? quantityInCart,
      final DateTime? createdAt}) = _$ProductDtoImpl;

  factory _ProductDto.fromJson(Map<String, dynamic> json) =
      _$ProductDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get excerpt;
  @override
  String get featuredImage;
  @override
  bool get isSelected;
  @override
  num? get price;
  @override
  num? get quantityInStock;
  @override
  num? get quantityInCart;
  @override
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$ProductDtoImplCopyWith<_$ProductDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
