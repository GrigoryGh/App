import 'package:flutter/material.dart';

import '../../models/product_model.dart';

class ProductPage extends StatelessWidget {
  ProductModel product;

  ProductPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.productName!),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 400, child: Image.network(product.imageUrl!)),
            Text(
              product.productName!,
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(product.description!),
            ),
            const Spacer(),
            Text(
              '\$ ${product.price.toString()}.00',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
