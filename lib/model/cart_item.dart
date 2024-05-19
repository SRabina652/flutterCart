import 'package:shopping_cart_provider/model/product_model.dart';

class Cart{
 final  Product product;
  int quantity;
  Cart({
   required this.product,
    required this.quantity
});
}