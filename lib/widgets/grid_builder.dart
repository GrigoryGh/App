import 'package:flutter/material.dart';
import 'package:indigo/api/indigo_api.dart';
import 'package:indigo/models/product_model.dart';
import 'package:indigo/pages/productpage/product_page.dart';

class GridBuild extends StatefulWidget {
  const GridBuild({super.key});

  @override
  State<GridBuild> createState() => _GridBuildState();
}

class _GridBuildState extends State<GridBuild> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: IndigoAPI().products.getProductsData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final products = snapshot.data as List<ProductModel>;

          return Padding(
            padding: const EdgeInsets.all(18),
            child: GridView.builder(
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductPage(
                                  productName: products[index].productName!,
                                  description: products[index].description!,
                                  imageURL: products[index].imageUrl!,
                                  price: products[index].price!)));
                    });
                  },
                  child: Container(
                    width: 180,
                    height: 180,
                    decoration: BoxDecoration(
                        boxShadow: [
                          const BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: Offset(0, 3))
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
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
                  maxCrossAxisExtent: 200,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
            ),
          );
        } else {
          return const Center(
            child: Text('No Items'),
          );
        }
      },
    );
  }
}
