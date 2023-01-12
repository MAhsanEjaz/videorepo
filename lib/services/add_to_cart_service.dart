import 'dart:convert';

import 'package:cashintransect/helper_services/local_db.dart';
import 'package:cashintransect/models/cart_model.dart';
import 'package:cashintransect/models/product_model.dart';
import 'package:cashintransect/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddToCartService {
  static Future<bool> addToCartService(
      {required BuildContext context, Products? products}) async {
    try {
      CartModel cartModel = CartModel(productModel: products);

     var data = await LocalDb().saveResponse(
          context: context,
          response: jsonEncode(cartModel.productModel!.toJson()));
     print(data);

      Provider.of<CartProvider>(context, listen: false)
          .addToCartItems(context: context, cart: cartModel);

      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Item Succesfully Add')));
      return true;
    } catch (err) {
      print(err);
      return false;
    }
  }
}
