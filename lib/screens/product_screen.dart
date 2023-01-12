import 'package:cashintransect/helper_services/local_db.dart';
import 'package:cashintransect/providers/cart_provider.dart';
import 'package:cashintransect/providers/product_provider.dart';
import 'package:cashintransect/screens/cart_screen.dart';
import 'package:cashintransect/screens/cart_view_screen.dart';
import 'package:cashintransect/services/product_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'product_view.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  getResponse() async {
    await LocalDb().getResponse(context: context);
  }

  productHandler() {
    ProductService().productService(context: context);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      productHandler();
      getResponse();
    });
  }

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer2<ProductProvider, CartProvider>(
        builder: (context, data, cart, _) {
      return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => const CartViewScreen()));
                },
                icon: const Icon(Icons.camera))
          ],
          title: Text('Products${cart.totalCalculatedPrice.toString()}'),
        ),
        body: data.products!.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : const SafeArea(
                child: SingleChildScrollView(child: ProductView())),
        bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            child: Row(
              children: [
                SelectIconColor(
                  iconData: CupertinoIcons.home,
                  color: selectedIndex == 0 ? true : false,
                  onTap: () {
                    selectedIndex = 0;
                    setState(() {});
                  },
                ),
                const Spacer(),
                SelectIconColor(
                  iconData: CupertinoIcons.chat_bubble_2_fill,
                  color: selectedIndex == 1 ? true : false,
                  onTap: () {
                    selectedIndex = 1;
                    setState(() {});
                  },
                ),
                const SizedBox(width: 50),
                const Spacer(),
                SelectIconColor(
                  iconData: CupertinoIcons.suit_heart_fill,
                  color: selectedIndex == 2 ? true : false,
                  onTap: () {
                    selectedIndex = 2;
                    setState(() {});
                  },
                ),
                const Spacer(),
                SelectIconColor(
                  iconData: CupertinoIcons.person,
                  color: selectedIndex == 3 ? true : false,
                  onTap: () {
                    selectedIndex = 3;
                    setState(() {});
                  },
                ),
              ],
            )),
        floatingActionButton: FloatingActionButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      );
    });
  }
}

class SelectIconColor extends StatefulWidget {
  IconData? iconData;
  Function()? onTap;
  bool color;

  SelectIconColor({this.iconData, required this.color, this.onTap});

  @override
  _SelectIconColorState createState() => _SelectIconColorState();
}

class _SelectIconColorState extends State<SelectIconColor> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (widget.onTap),
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Container(
          child: Icon(
            widget.iconData,
            color: widget.color ? Colors.orange : Colors.black26,
            size: 30,
          ),
        ),
      ),
    );
  }
}
