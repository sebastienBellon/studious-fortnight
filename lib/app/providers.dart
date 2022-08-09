import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_ecommerce_riverpod_firebase/services/firestore_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firebaseAuthProvider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

final authStateChangeProvider = StreamProvider<User?>((ref) {
  return ref.watch(firebaseAuthProvider).authStateChanges();
});

final databaseProvider = Provider<FireStoreService?>((ref) {
  final auth = ref.watch(authStateChangeProvider);
  String? uid = auth.asData?.value?.uid;
  if (uid != null) {
    return FireStoreService(uid: uid);
  }
  return null;
});
