import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stacked/stacked.dart';

class OrderService with ListenableServiceMixin {
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('orders');
}
