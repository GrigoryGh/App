import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  String description;
  String imageURL;
  String productName;
  int price;

  ProductPage(
      {super.key,
      required this.description,
      required this.imageURL,
      required this.productName,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productName),
      ),
      body: Column(
        children: [
          SizedBox(height: 400, child: Image.network(imageURL)),
          Text(
            productName,
            style: const TextStyle(
              fontSize: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(description),
          ),
          const Spacer(),
          Text(
            '\$ ${price.toString()}.00',
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
