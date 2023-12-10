import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_dto.freezed.dart';
part 'product_dto.g.dart';

@freezed
class ProductDto with _$ProductDto {
  // ignore: invalid_annotation_target
  @JsonSerializable(
    fieldRename: FieldRename.snake,
  )
  factory ProductDto({
    String? id,
    @Default(false) bool isSelected,
    String? imageUrl,
    String? name,
    String? description,
    num? price,
    num? quantityInStock,
    num? quantityInCart,
    DateTime? createdAt,
  }) = _ProductDto;

  factory ProductDto.fromJson(Map<String, dynamic> json) =>
      _$ProductDtoFromJson(json);

  factory ProductDto.fromFirstore(
          DocumentSnapshot snapshot, SnapshotOptions? options) =>
      ProductDto.fromJson(snapshot.data() as Map<String, dynamic>);

  static Map<String, Object?> toFirestore(
          ProductDto product, SetOptions? options) =>
      product.toJson();
}
