import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_riverpod_firebase/models/product.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ProductListTile extends StatelessWidget {
  final Product product;
  final Function()? onPressed;
  final Function() onDelete;
  const ProductListTile(
      {Key? key, required this.product, this.onPressed, required this.onDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Slidable(
      key: const ValueKey(0), // simple value key
      endActionPane: ActionPane(
        // end pane as it is on the "end" of the tile
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (c) => onDelete(), // function to delete
            backgroundColor: const Color(0xFFFE4A49), // a red color
            foregroundColor: Colors.white,
            icon: Icons.delete, // Delete icon
            label: 'Delete', // Delete text
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () {
          if (onPressed != null) onPressed!();
        },
        child: ListTile(
          leading: product.imageUrl != ''
              ? Image.network(product.imageUrl)
              : Container(),
          title: Text(product.name),
          trailing: Text('${product.price} \$'),
        ),
      ),
    );
  }
}
