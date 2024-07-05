import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/cart_model.dart';
import '../model/product_model.dart';
import '../model/user_model.dart';

class ApiService {
  final String baseUrl = 'https://fakestoreapi.com';

  Future<User> fetchUser() async {
    final response = await http.get(Uri.parse('$baseUrl/users/1'));
    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load user');
    }
  }

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/products'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((product) => Product.fromJson(product)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  static Future<List<Product>> fetchItems() async {
    final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));

    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<Product> products =
          body.map((dynamic item) => Product.fromJson(item)).toList();
      return products;
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<List<Cart>> fetchCarts() async {
    final response = await http.get(Uri.parse('$baseUrl/carts'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((cart) => Cart.fromJson(cart)).toList();
    } else {
      throw Exception('Failed to load carts');
    }
  }
}
