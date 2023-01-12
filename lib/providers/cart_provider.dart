import 'dart:convert';

import 'package:cashintransect/helper_services/local_db.dart';
import 'package:cashintransect/models/cart_model.dart';
import 'package:flutter/cupertino.dart';

class CartProvider extends ChangeNotifier {
  List<CartModel>? cartProducts = [];
  double totalCalculatedPrice = 0;

  getCartsItem({List<CartModel>? newCartProducts}) {
    cartProducts = newCartProducts;
    _totalCalculatedPrice();
    notifyListeners();
  }

  addToCartItems({required BuildContext context, CartModel? cart}) {
    for (int i = 0; i < cartProducts!.length; i++) {
      if (cartProducts![i].productModel!.id == cart!.productModel!.id) {
        cartProducts![i].productModel!.qty++;
        cartProducts![i].productModel!.price ==
            (double.parse(cartProducts![i].productModel!.price.toString()) *
                cartProducts![i].productModel!.qty);

        _totalCalculatedPrice();
        notifyListeners();
        return;
      } else {
        notifyListeners();
      }
    }
    cartProducts!.add(cart!);

    _totalCalculatedPrice();
    notifyListeners();
  }

  updateCartItems({required int index, required int qty}) {
    cartProducts![index].productModel!.qty = qty;
    cartProducts![index].productModel!.price ==
        qty *
            double.parse(
              cartProducts![index].productModel!.price.toString(),
            );
    _totalCalculatedPrice();
    notifyListeners();
  }

  deleteItem(BuildContext context, int? index) {
    cartProducts!.removeAt(index!);
    _totalCalculatedPrice();
    notifyListeners();
  }

  _totalCalculatedPrice() {
    double tempTotal = 0;
    cartProducts!.forEach((element) {
      tempTotal = tempTotal + element.productModel!.price!;
    });
    totalCalculatedPrice = tempTotal;
  }
}
