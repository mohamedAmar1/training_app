

import 'package:dio/dio.dart';
import 'package:login_app/Models/Classes/cart_model.dart';

class CartService {
  static final dio = Dio();

  static Future<List<Product>> getCartData() async {
    final response = await dio.get("https://dummyjson.com/carts/1");
    var data = response.data;
    Cart cart = Cart.fromJson(data);
    return cart.products ?? [];
  }

}