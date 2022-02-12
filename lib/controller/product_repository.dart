import 'dart:convert';

import 'package:http/http.dart' as http;

class ProductRepository {
  var url = "https://fakestoreapi.com/products";

  fetchProducts() async {
    final response = await http.get(Uri.parse(url));
    final responseFinal = await json.decode(response.body);
    return responseFinal;
  }
}
