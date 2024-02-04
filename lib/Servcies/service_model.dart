


import 'package:dio/dio.dart';
import 'package:login_app/Models/Classes/product_model.dart';

class ProductService{
 static final dio = Dio();

 static Future<List<Product>> getProductsData() async {
   final response = await dio.get("https://dummyjson.com/products");
   var data = response.data;
   Products products = Products.fromJson(data);
   return products.products ?? [];
 }

}