import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shamo/models/carts_model.dart';

class TransactionService {
  String baseUrl = "https://shamo-backend.buildwithangga.id/api";

  Future<bool> checkout(
      String token, List<CartsModel> carts, double totalPrice) async {
    var url = "$baseUrl/checkout";
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    var body = jsonEncode({
      'address': 'Marsemon',
      'items': carts
          .map((e) => {
                'id': e.product.id,
                'quantity': e.quantity,
              })
          .toList(),
      'status': "PENDING",
      'total_price': totalPrice,
      'shipping_price': 0,
    });

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception("Gagal melakukan checkout");
    }
  }
}
