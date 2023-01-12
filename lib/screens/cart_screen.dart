import 'package:cashintransect/helper_services/cart_card_screen.dart';
import 'package:cashintransect/models/cart_model.dart';
import 'package:cashintransect/providers/cart_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  List<CartModel>? model = [];

  CartScreen({super.key, this.model});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, data, _) {
      return Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: widget.model!.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return CartCard(
                          onTap: () {
                            data.deleteItem(context, index);
                            setState(() {});
                          },
                          cartModel: widget.model![index],
                          index: index,
                        );
                      })
                ],
              ),
            ),
          ),
          Text(data.totalCalculatedPrice.toString())
        ],
      );
    });
  }
}
