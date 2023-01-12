import 'dart:convert';

import 'package:cashintransect/helper_services/product_card.dart';
import 'package:cashintransect/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductView extends StatefulWidget {
  const ProductView({Key? key}) : super(key: key);

  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(builder: (context, data, _) {
      List<Widget> widget = [];
      data.products!.forEach((element) {
        widget.add(ProductCard(
          products: element,
          // response: element.images.last,
        ));
      });

      return Center(
        child: Wrap(
          children: widget,
        ),
      );
    });
  }
}
