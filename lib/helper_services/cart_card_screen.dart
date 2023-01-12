import 'package:cashintransect/helper_services/local_db.dart';
import 'package:cashintransect/models/cart_model.dart';
import 'package:cashintransect/providers/cart_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartCard extends StatefulWidget {
  CartModel? cartModel;
  int? index;
  Function()? onTap;

  CartCard({super.key, this.cartModel, this.index, this.onTap});

  @override
  _CartCardState createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(widget
                              .cartModel!.productModel!.thumbnail
                              .toString()),
                          fit: BoxFit.cover)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.cartModel!.productModel!.title.toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 25),
                    Row(
                      children: [
                        InkWell(
                          onTap: widget.cartModel!.productModel!.qty < 2
                              ? null
                              : () {
                                  widget.cartModel!.productModel!.qty--;
                                  setState(() {});
                                },
                          child: const Icon(CupertinoIcons.minus),
                        ),
                        Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.black26)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(widget.cartModel!.productModel!.qty
                                  .toString()),
                            )),
                        InkWell(
                            onTap: () {
                              widget.cartModel!.productModel!.qty++;

                              Provider.of<CartProvider>(context, listen: false)
                                  .updateCartItems(
                                      index: widget.index!,
                                      qty: widget.cartModel!.productModel!.qty);
                              setState(() {});
                            },
                            child: const Icon(CupertinoIcons.plus)),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                              '${double.parse(widget.cartModel!.productModel!.qty.toString()) * widget.cartModel!.productModel!.price!.toInt()}'),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(
            right: 15,
            top: 10,
            child:
                InkWell(onTap: (widget.onTap), child: const Icon(Icons.delete)))
      ],
    );
  }
}
