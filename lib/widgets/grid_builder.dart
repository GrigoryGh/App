import 'package:flutter/material.dart';
import 'package:indigo/api/indigo_api.dart';
import 'package:indigo/models/product_model.dart';
import 'package:indigo/pages/productpage/product_page.dart';

class GridBuild extends StatelessWidget {
  List products = [];

  GridBuild(this.products, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: GridView.builder(
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ProductPage(product: products[index])));
            },
            child: Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(boxShadow: const [
                BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(0, 3))
              ], color: Colors.white, borderRadius: BorderRadius.circular(5)),
              child: Column(
                children: [
                  SizedBox(
                      height: 105,
                      width: 105,
                      child: Image.network(products[index].imageUrl!)),
                  Text(
                    products[index].productName ?? '',
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text('\$${products[index].price.toString()}.00'),
                ],
              ),
            ),
          );
        },
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200, crossAxisSpacing: 10, mainAxisSpacing: 10),
      ),
    );
  }
}
