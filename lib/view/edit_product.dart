import 'package:flutter/material.dart';
import 'package:flutter_gki/controllers/controller.dart';
import '../view/home.dart';
import '../models/model.dart';

class EditProduct extends StatefulWidget {
  final String id, name, category, price, image;
  EditProduct({
    super.key,
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.image,
  });
  @override
  EditProductState createState() => EditProductState();
}
class EditProductState extends State<EditProduct>{
  TextEditingController productName = TextEditingController();
  TextEditingController categoryName = TextEditingController();
  TextEditingController priceProduct = TextEditingController();
  TextEditingController imageProduct = TextEditingController();

  ProductController productController = ProductController();
  void editProduct(){
    productController.updateProduct(ProductModel(
      id: widget.id, 
      name: productName.text, 
      category: categoryName.text,
      price: priceProduct.text,
      image:  imageProduct.text,
    ));
  }
  
  @override
  Widget build(BuildContext context) {
    productName.text = widget.name;
    categoryName.text = widget.category;
    priceProduct.text = widget.price;
    imageProduct.text = widget.image;
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
                  editProduct();
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  "Edit product",
                  style: TextStyle(
                    fontSize: 18,
                    color: const Color.fromARGB(255, 204, 77, 136),
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}