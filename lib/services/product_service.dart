import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dionniebee/app/models/product_dto.dart';

class ProductService {
  final CollectionReference productsCollection =
      FirebaseFirestore.instance.collection('products');

  // Create the controller that will broadcast the posts
  final StreamController<List<ProductDto>> _postsController =
      StreamController<List<ProductDto>>.broadcast();

  Stream listenToPostsRealTime() {
    // Register the handler for when the posts data changes
    productsCollection.snapshots().listen((postsSnapshot) {
      if (postsSnapshot.docs.isNotEmpty) {
        var posts = postsSnapshot.docs
            .map((snapshot) =>
                ProductDto.fromJson(snapshot.data() as Map<String, dynamic>)
                    .copyWith(id: snapshot.id))
            //.where((mappedItem) => mappedItem.id != null)
            .toList();
        print(posts);
        // Add the posts onto the controller
        _postsController.add(posts);
      }
    });

    // Return the stream underlying our _postsController.
    return _postsController.stream;
  }

  Future<void> addProduct(ProductDto product) async {
    await productsCollection.add(product.toJson);
  }

  Stream<List<ProductDto>> getProductsStream() {
    return productsCollection.snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => ProductDto.fromJson(doc.data() as Map<String, dynamic>)
              .copyWith(id: doc.id))
          .toList();
    });
  }

  Stream<ProductDto> getProductStream(String productId) {
    return productsCollection.doc(productId).snapshots().map((snapshot) {
      return ProductDto.fromJson(snapshot.data() as Map<String, dynamic>)
          .copyWith(id: snapshot.id);
    });
  }

  Future<void> updateProduct(ProductDto product) async {
    await productsCollection
        .doc(product.id.toString())
        .update(product.toJson());
  }

  Future<void> deleteProduct(int id) async {
    await productsCollection.doc(id.toString()).delete();
  }
}
