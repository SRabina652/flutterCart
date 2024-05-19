import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shopping_cart_provider/api/api.dart';
import 'package:shopping_cart_provider/model/product_model.dart';
class HttpRestApi{
 static Future<List<Product>> getProductApi()async{
    List<Product> productList =[];
    final response=await http.get(Uri.parse(baseApi+product));
    if(response.statusCode ==200){
      // fetch data from the list
      final lists=jsonDecode(response.body.toString()) as List;

      //this is same as the map

      // for(var element in lists){
      //   productList.add(Product.fromJson(element));
      // }
      productList = lists.map((element) => Product.fromJson(element)).toList();
      print("this is the product list: "+productList.toString());
    }
    return productList;
  }
}