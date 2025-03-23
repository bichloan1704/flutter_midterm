class ProductModel {
  String id;
  String name, image, category;
  String price;

  ProductModel({required this.id, required this.name, required this.price, required this.image, required this.category});

  // Chuyển từ Firestore map sang model
  factory ProductModel.fromMap(String id, Map<String, dynamic> data) {
    return ProductModel(
      id: id, // Gán id từ Firestore
      name: data['name'] ?? '',
      price: data['price'] ?? 0,
      image: data['image'] ?? '',
      category: data['category'] ?? '',
    );
  }

  // Chuyển từ model sang Firestore map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'image': image,
      'category': category,
    };
  }
}
class UserModel{
  String id,username, password;
  UserModel({required this.id, required this.username, required this.password});

  factory UserModel.fromMap(String id, Map<String, dynamic> users){
    return UserModel(
      id: id,
      username: users['name'] ?? '', 
      password: users['password'] ?? '',
    );
  }
}