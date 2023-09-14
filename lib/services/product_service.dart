import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dionniebee/app/models/product_dto.dart';

class ProductService {
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('products');

  Stream<List<ProductDto>> getItemsStream() {
    return collectionReference.snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => ProductDto.fromJson(doc.data() as Map<String, dynamic>)
              .copyWith(id: doc.id))
          .toList();
    });
  }

  Stream<ProductDto?> getItemStream(String? productId) {
    if (productId != null) {
      return collectionReference.doc(productId).snapshots().map((snapshot) {
        return ProductDto.fromJson(snapshot.data() as Map<String, dynamic>)
            .copyWith(id: snapshot.id);
      });
    }
    return const Stream.empty();
  }

  Future<void> updateItem(ProductDto product) async {
    await collectionReference
        .doc(product.id.toString())
        .update(product.toJson());
  }

  Future<void> addItem(ProductDto product) async {
    await collectionReference.add(product.toJson);
  }

  Future<void> deleteItem(int id) async {
    await collectionReference.doc(id.toString()).delete();
  }
}
