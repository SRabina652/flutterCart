import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../model/cart_item.dart';
import '../model/product_model.dart';

class CartProvider extends ChangeNotifier{
  final List<Cart> _cartItems=[];

  List<Cart> get cartItems=>_cartItems;

  void addToCart(Product product, int  quantity){
    var _existingCartItem = _cartItems.firstWhereOrNull(
        (item)=>item.product.id == product.id,
    );
    if(_existingCartItem != null){
      _existingCartItem.quantity += 1;
    }else{
      _cartItems.add(Cart(product: product, quantity: quantity));
    }
    notifyListeners();
  }
}