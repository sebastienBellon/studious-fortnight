import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_ecommerce_riverpod_firebase/models/product.dart';

class FireStoreService {
  final String uid;
  FireStoreService({required this.uid});

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addProduct(Product product) async {
    final docId = firestore.collection("products").doc().id;
    await firestore
        .collection('products')
        .doc(docId)
        .set(product.toMap(docId))
        .catchError((onError) => print("Error"));
  }

  Stream<List<Product>> getProducts() {
    return firestore
        .collection('products')
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) {
              final d = doc.data();
              return Product.fromMap(d);
            }).toList());
  }

  Future<void> deleteProduct(String id) async {
    return await firestore.collection('products').doc(id).delete();
  }
}
