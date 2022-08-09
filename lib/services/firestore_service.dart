import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_ecommerce_riverpod_firebase/models/product.dart';

class FireStoreService {
  final String uid;
  FireStoreService({required this.uid});

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addProduct(Product product) async {
    await firestore
        .collection('products')
        .add(product.toMap())
        .then((value) => print(value))
        .catchError((onError) => print("Error"));
  }
}
