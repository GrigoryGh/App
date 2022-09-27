import 'package:flutter/material.dart';
import 'package:indigo/api/indigo_api.dart';
import 'package:indigo/models/product_model.dart';
import 'package:indigo/pages/productpage/product_page.dart';

class ListBuild extends StatelessWidget {
  List products = [];
  

  ListBuild(this.products, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.separated(
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(boxShadow: [
                const BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(0, 3))
              ], color: Colors.white, borderRadius: BorderRadius.circular(5)),
              height: 150,
              child: ListTile(
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        height: 180,
                        width: 100,
                        child: Image.network(products[index].imageUrl!)),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        products[index].productName ?? '',
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                trailing: Text(
                  '\$${products[index].price.toString()}.00',
                  style: const TextStyle(color: Colors.grey),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductPage(
                              product: products[index],
                             )));
                },
              ),
            );
          },
          itemCount: products.length,
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          },
        ));
  }
}
