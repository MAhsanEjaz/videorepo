import 'package:cashintransect/helper_services/local_db.dart';
import 'package:cashintransect/providers/cart_provider.dart';
import 'package:cashintransect/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartViewScreen extends StatefulWidget {
  const CartViewScreen({Key? key}) : super(key: key);

  @override
  _CartViewScreenState createState() => _CartViewScreenState();
}

class _CartViewScreenState extends State<CartViewScreen> {
  getResponse() async {
    var data = await LocalDb().getResponse(context: context);
    setState(() {});
    print(data);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getResponse();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, data, _) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Cart'),
        ),
        body: SafeArea(
          child: CartScreen(model: data.cartProducts),
        ),
      );
    });
  }
}
