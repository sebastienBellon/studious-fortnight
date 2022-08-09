import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_riverpod_firebase/app/pages/admin/admin_add_product.dart';
import 'package:flutter_ecommerce_riverpod_firebase/app/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AdminHome extends ConsumerWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Home'),
        actions: [
          IconButton(
            onPressed: () => ref.read(firebaseAuthProvider).signOut(),
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => const AdminAddProductPage()),
        ),
      ),
    );
  }
}
