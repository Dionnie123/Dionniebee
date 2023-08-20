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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductDto _$ProductDtoFromJson(Map<String, dynamic> json) {
  return _ProductDto.fromJson(json);
}

/// @nodoc
mixin _$ProductDto {
  String? get id => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  num? get price => throw _privateConstructorUsedError;
  int? get quantityInStock => throw _privateConstructorUsedError;
  int? get quantityInCart => throw _privateConstructorUsedError;
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
      {String? id,
      String? imageUrl,
      String? name,
      String? description,
      num? price,
      int? quantityInStock,
      int? quantityInCart,
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
    Object? id = freezed,
    Object? imageUrl = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? price = freezed,
    Object? quantityInStock = freezed,
    Object? quantityInCart = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as num?,
      quantityInStock: freezed == quantityInStock
          ? _value.quantityInStock
          : quantityInStock // ignore: cast_nullable_to_non_nullable
              as int?,
      quantityInCart: freezed == quantityInCart
          ? _value.quantityInCart
          : quantityInCart // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProductDtoCopyWith<$Res>
    implements $ProductDtoCopyWith<$Res> {
  factory _$$_ProductDtoCopyWith(
          _$_ProductDto value, $Res Function(_$_ProductDto) then) =
      __$$_ProductDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? imageUrl,
      String? name,
      String? description,
      num? price,
      int? quantityInStock,
      int? quantityInCart,
      DateTime? createdAt});
}

/// @nodoc
class __$$_ProductDtoCopyWithImpl<$Res>
    extends _$ProductDtoCopyWithImpl<$Res, _$_ProductDto>
    implements _$$_ProductDtoCopyWith<$Res> {
  __$$_ProductDtoCopyWithImpl(
      _$_ProductDto _value, $Res Function(_$_ProductDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? imageUrl = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? price = freezed,
    Object? quantityInStock = freezed,
    Object? quantityInCart = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$_ProductDto(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as num?,
      quantityInStock: freezed == quantityInStock
          ? _value.quantityInStock
          : quantityInStock // ignore: cast_nullable_to_non_nullable
              as int?,
      quantityInCart: freezed == quantityInCart
          ? _value.quantityInCart
          : quantityInCart // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_ProductDto implements _ProductDto {
  _$_ProductDto(
      {this.id,
      this.imageUrl,
      this.name,
      this.description,
      this.price,
      this.quantityInStock,
      this.quantityInCart,
      this.createdAt});

  factory _$_ProductDto.fromJson(Map<String, dynamic> json) =>
      _$$_ProductDtoFromJson(json);

  @override
  final String? id;
  @override
  final String? imageUrl;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final num? price;
  @override
  final int? quantityInStock;
  @override
  final int? quantityInCart;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'ProductDto(id: $id, imageUrl: $imageUrl, name: $name, description: $description, price: $price, quantityInStock: $quantityInStock, quantityInCart: $quantityInCart, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
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
  int get hashCode => Object.hash(runtimeType, id, imageUrl, name, description,
      price, quantityInStock, quantityInCart, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductDtoCopyWith<_$_ProductDto> get copyWith =>
      __$$_ProductDtoCopyWithImpl<_$_ProductDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductDtoToJson(
      this,
    );
  }
}

abstract class _ProductDto implements ProductDto {
  factory _ProductDto(
      {final String? id,
      final String? imageUrl,
      final String? name,
      final String? description,
      final num? price,
      final int? quantityInStock,
      final int? quantityInCart,
      final DateTime? createdAt}) = _$_ProductDto;

  factory _ProductDto.fromJson(Map<String, dynamic> json) =
      _$_ProductDto.fromJson;

  @override
  String? get id;
  @override
  String? get imageUrl;
  @override
  String? get name;
  @override
  String? get description;
  @override
  num? get price;
  @override
  int? get quantityInStock;
  @override
  int? get quantityInCart;
  @override
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_ProductDtoCopyWith<_$_ProductDto> get copyWith =>
      throw _privateConstructorUsedError;
}
