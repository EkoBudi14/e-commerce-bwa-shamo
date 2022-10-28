import 'package:flutter/cupertino.dart';
import 'package:shamo/models/carts_model.dart';
import 'package:shamo/models/product_model.dart';

class CartsProvider extends ChangeNotifier {
  List<CartsModel> _carts = [];

  List<CartsModel> get carts => _carts;

  set carts(List<CartsModel> carts) {
    _carts = carts;
    notifyListeners();
  }

  addCarts(ProductModel product) {
    if (productExist(product)) {
      int index =
          _carts.indexWhere((element) => element.product.id == product.id);
      _carts[index].quantity++;
    } else {
      _carts.add(CartsModel(
        id: _carts.length,
        product: product,
        quantity: 1,
      ));
    }
    notifyListeners();
  }

  removeCarts(int id) {
    _carts.removeAt(id);
    notifyListeners();
  }

  addQuantity(int id) {
    _carts[id].quantity++;
    notifyListeners();
  }

  totalItems() {
    int total = 0;
    for (var item in _carts) {
      total += item.quantity;
    }
    return total;
  }

  totalPrice() {
    double total = 0;
    for ( var item in _carts) {
      total += (item.quantity * item.product.price);
    }

    return total;
  }

  reduceQuantity(int id) {
    _carts[id].quantity--;
    if (_carts[id].quantity == 0) {
      _carts.removeAt(id);
    }
    notifyListeners();
  }

  productExist(ProductModel product) {
    if (_carts.indexWhere((element) => element.product.id == product.id) ==
        -1) {
      return false;
    } else {
      return true;
    }
  }
}
