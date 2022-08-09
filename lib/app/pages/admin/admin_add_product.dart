import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_riverpod_firebase/app/providers.dart';
import 'package:flutter_ecommerce_riverpod_firebase/models/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AdminAddProductPage extends ConsumerStatefulWidget {
  const AdminAddProductPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AdminAddProductPageState();
}

class _AdminAddProductPageState extends ConsumerState<AdminAddProductPage> {
  final titleTextEditingController = TextEditingController();
  final priceEditingController = TextEditingController();
  final descriptionEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            CustomInputFieldFb1(
              inputController: titleTextEditingController,
              labelText: 'Product Name',
              hintText: 'Product Name',
            ),
            const SizedBox(height: 15),
            CustomInputFieldFb1(
              inputController: descriptionEditingController,
              labelText: 'Product Description',
              hintText: 'Product Description',
            ),
            const SizedBox(height: 15),
            CustomInputFieldFb1(
              inputController: priceEditingController,
              labelText: 'Price',
              hintText: 'Price',
            ),
            const Spacer(),
            ElevatedButton(
                onPressed: () => _addProduct(),
                child: const Text("Add Product")),
          ],
        ),
      ),
    );
  }

  _addProduct() async {
    final storage = ref.read(databaseProvider);
    if (storage == null) {
      return;
    }
    await storage.addProduct(
      Product(
        name: titleTextEditingController.text,
        description: descriptionEditingController.text,
        price: double.parse(priceEditingController.text),
        imageUrl: "image",
      ),
    );
    Navigator.pop(context);
  }
}

class CustomInputFieldFb1 extends StatelessWidget {
  final TextEditingController inputController;
  final String hintText;
  final Color primaryColor;
  final String labelText;

  const CustomInputFieldFb1(
      {Key? key,
      required this.inputController,
      required this.hintText,
      required this.labelText,
      this.primaryColor = Colors.indigo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            offset: const Offset(12, 26),
            blurRadius: 50,
            spreadRadius: 0,
            color: Colors.grey.withOpacity(.1)),
      ]),
      child: TextField(
        controller: inputController,
        onChanged: (value) {
          //Do something wi
        },
        keyboardType: TextInputType.emailAddress,
        style: const TextStyle(fontSize: 16, color: Colors.black),
        decoration: InputDecoration(
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey.withOpacity(.75)),
          fillColor: Colors.transparent,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
          border: UnderlineInputBorder(
            borderSide:
                BorderSide(color: primaryColor.withOpacity(.1), width: 2.0),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: primaryColor, width: 2.0),
          ),
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 2.0),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: primaryColor.withOpacity(.1), width: 2.0),
          ),
        ),
      ),
    );
  }
}
