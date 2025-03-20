import 'package:flutter/material.dart';
import 'package:flutter_gki/controllers/controller.dart';

class CreateProduct extends StatefulWidget {
  @override
  CreateProductState createState() => CreateProductState();
}

class CreateProductState extends State<CreateProduct> {
  TextEditingController productName = TextEditingController();
  TextEditingController categoryName = TextEditingController();
  TextEditingController priceProduct = TextEditingController();
  TextEditingController imageProduct = TextEditingController();
  ProductController productController = ProductController();

  bool validateProduct(String name, String category, String price, String image) {
    if (name.isEmpty || category.isEmpty || price.isEmpty || image.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Please re-enter!')));
      return false;
    }
    return true;
  }

  void createProduct() {
    String name = productName.text;
    String category = categoryName.text;
    String price = priceProduct.text;
    String image = imageProduct.text;
    if (validateProduct(name, category, price, image)) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Thêm thành công!')));
      productName.clear();
      categoryName.clear();
      priceProduct.clear();
      imageProduct.clear();
      productController.addProduct(name, category, price, image);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                controller: productName,
                decoration: InputDecoration(
                    labelText: "Enter product's name:",
                    border: OutlineInputBorder()),
              ),
              SizedBox(height: 10),
              TextField(
                controller: categoryName,
                decoration: InputDecoration(
                    labelText: "Enter category:", border: OutlineInputBorder()),
              ),
              SizedBox(height: 10),
              TextField(
                controller: priceProduct,
                decoration: InputDecoration(
                    labelText: "Enter product's price:",
                    border: OutlineInputBorder()),
              ),
              SizedBox(height: 10),
              TextField(
                controller: imageProduct,
                decoration: InputDecoration(
                    labelText: "Enter image url:",
                    border: OutlineInputBorder()),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  createProduct();
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  "Create product",
                  style: TextStyle(
                    fontSize: 18,
                    color: const Color.fromARGB(255, 204, 77, 136),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
