import 'dart:convert';

import 'package:cashintransect/helper_services/local_db.dart';
import 'package:cashintransect/models/product_model.dart';
import 'package:cashintransect/providers/product_provider.dart';
import 'package:cashintransect/services/custom_get_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ProductService {
  Future productService({required BuildContext context}) async {
    try {
      var res = await CustomGetService().customGetService(
          context: context, url: 'https://dummyjson.com/products');
      if (res != null) {
        ProductModel productModel = ProductModel.fromJson(res);

        Provider.of<ProductProvider>(context, listen: false)
            .getProducts(newProducts: productModel.products);
        return true;
      } else {
        return false;
      }
    } catch (err) {
      print(err);
      return false;
    }
  }
}
