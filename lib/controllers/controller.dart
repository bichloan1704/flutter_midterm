import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/model.dart';

class ProductController {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Lấy DL từ firebase
  Future<List<ProductModel>> getProducts() async {
    QuerySnapshot querySnapshot = await _db.collection('products').get();
    List<ProductModel> products = [];
    for (var doc in querySnapshot.docs) {
      products.add(
          ProductModel.fromMap(doc.id, doc.data() as Map<String, dynamic>));
    }
    return products;
  }

  Stream<List<ProductModel>> fetchProducts() {
    return _db.collection('products').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return ProductModel.fromMap(
            doc.id, doc.data()); // Truyền id từ Firestore vào model
      }).toList();
    });
  }

  Future<void> addProduct(
      String name, String category, String price, String image) async {
    try {
      await _db.collection("products").add(
          {'name': name, 'category': category, 'price': price, 'image': image});
    } catch (e) {
      print('Lỗi khi thêm vào firebase');
    }
  }

  Future<void> updateProduct(ProductModel product) async {
    try {
      await _db.collection('products').doc(product.id).update(product.toMap());
    } catch (e) {
      print('Lỗi khi cập nhật sản phẩm: $e');
    }
  }

  Future<void> deleteProduct(String productId) async {
    try {
      await _db.collection('products').doc(productId).delete();
      print("Sản phẩm đã được xóa thành công.");
    } catch (e) {
      print("Lỗi khi xóa sản phẩm: $e");
    }
  }
}
