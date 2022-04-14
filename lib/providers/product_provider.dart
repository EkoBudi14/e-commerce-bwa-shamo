import 'package:flutter/cupertino.dart';
import 'package:shamo/models/product_model.dart';
import 'package:shamo/services/product_services.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> _product = [];

  List<ProductModel> get products => _product;

  set product(List<ProductModel> products) {
    _product = products;
    notifyListeners();
  }

  Future<void> getProducts() async {
    try {
      List<ProductModel> products = await ProductService().getProducts();
      _product = products;
    } catch (e) {
      print(e);
    }
  }
}