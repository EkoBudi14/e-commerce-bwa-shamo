import 'package:shamo/models/product_model.dart';
import 'package:shamo/widget/product_card.dart';

class CartsModel {
  int id;
  int quantity;
  ProductModel product;

  CartsModel({this.id, this.product, this.quantity});


  CartsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    product = ProductModel.fromJson(json['product']);
  }

  Map<String, dynamic> ToJson() {
    return {
      'id' : id,
      'product' : product.toJson(),
      'quantity' : quantity,
    };
  }

  double getTotalPrice() {
    return product.price * quantity;
  }
}

