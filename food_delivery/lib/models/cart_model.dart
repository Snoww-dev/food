import 'package:food_delivery/models/products_model.dart';

class CartModel {
  int? id;
  String? name;
  int?price;
  String?img;
  int? quantity;
  bool? isExist;
  String? time;
  ProductModel? product;

  // Constructor với các tham số tùy chọn
  CartModel(
    {this.id,
    this.name,
    this.price,
    this.img,
    this.quantity,
    this.isExist,
    this.time,
    this.product,
  });

  // Constructor để khởi tạo đối tượng từ JSON
  CartModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    price = json['price'];
    img = json['img'];
    quantity = json['quantity'];
    isExist = json['isExist'];
    time = json['time'];
    product=ProductModel.fromJson(json['product']);
  }
}