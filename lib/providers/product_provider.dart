import 'package:cashintransect/models/product_model.dart';
import 'package:flutter/cupertino.dart';

class ProductProvider extends ChangeNotifier {
  List<Products>? products = [];

  getProducts({List<Products>? newProducts}) {
    products = newProducts;
    notifyListeners();
  }
}
