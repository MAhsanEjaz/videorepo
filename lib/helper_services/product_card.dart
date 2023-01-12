import 'dart:convert';

import 'package:cashintransect/models/product_model.dart';
import 'package:cashintransect/services/add_to_cart_service.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  Products? products;

  List<String>? response = [];

  ProductCard({this.products, this.response});

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        AddToCartService.addToCartService(
            context: context, products: widget.products);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width / 2.2,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image:
                          NetworkImage(widget.products!.thumbnail.toString()),
                      fit: BoxFit.fill)),
            ),
            Text(widget.products!.price.toString())
          ],
        ),
      ),
    );
  }
}
