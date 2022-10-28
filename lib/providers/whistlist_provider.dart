import 'package:flutter/cupertino.dart';
import 'package:shamo/models/product_model.dart';

class WishlistProvider extends ChangeNotifier {
  List<ProductModel> _whislist = [];

  List<ProductModel> get wishlist => _whislist;

  set wishlist(List<ProductModel> wishlist) {
    _whislist = wishlist;
    notifyListeners();
  }

  setProduct(ProductModel product) {
    if (!isWishliat(product)) {
      _whislist.add(product);
    } else {
      _whislist.removeWhere((element) => element.id == product.id);
    }
    notifyListeners();
  }

  isWishliat(ProductModel product) {
    if (_whislist.indexWhere((element) => element.id == product.id) == -1) {
      return false;
    } else {
      return true;
    }
  }
}
