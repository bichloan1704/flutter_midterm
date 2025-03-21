import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gki/view/create_product.dart';
import '../controllers/controller.dart';
import '../models/model.dart';
import '../view/product_card.dart';
import '../view/edit_product.dart';

class ProductListView extends StatefulWidget {
  @override
  _ProductListViewState createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  final ProductController productController = ProductController();
  List<ProductModel> products = [];

  @override
  void initState() {
    super.initState();
    setProduct();
  }

  Future<void> setProduct() async {
    var fetchedProducts = await productController.getProducts();
    setState(() {
      products = fetchedProducts;
    });
  }
  void deleteProduct(String id){
    productController.deleteProduct(id);
  }

  @override
  Widget build(BuildContext context) {
    setProduct();
    return Scaffold(
      // appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                // Dùng Expanded để GridView tự mở rộng trong Column
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 1.5,
                  ),
                  itemCount: products.length,
                  padding: EdgeInsets.only(bottom: 100),
                  itemBuilder: (context, index) {
                    return ProducCard(
                      name: products[index].name,
                      category: products[index].category,
                      price: products[index].price,
                      image: products[index].image,
                      editPress: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditProduct(
                                id: products[index].id,
                                name: products[index].name,
                                category: products[index].category,
                                price: products[index].price,
                                image: products[index].image)),
                        );
                      },
                      deletePress: () {
                        deleteProduct(products[index].id);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateProduct()),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                backgroundColor: Colors.grey[200]
              ),
              child: Text(
                "Add product",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 204, 77, 136),
                ),
              ),
            ),
          ),
        ],
      ),
      )
      
    );
  }
}
