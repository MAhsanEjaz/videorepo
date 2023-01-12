import 'package:cashintransect/screens/cash_screen.dart';
import 'package:cashintransect/widgets/custom_appbar.dart';
import 'package:cashintransect/widgets/custom_home_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectButton = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context,
        'Home',
        Colors.white,
        Colors.black,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: CustomHomeCard(
                        color: selectButton == 0 ? true : false,
                        onTap: () {
                          selectButton = 0;
                          setState(() {});
                        },
                        text: 'Cash',
                      ),
                    ),
                    Expanded(
                      child: CustomHomeCard(
                        color: selectButton == 1 ? true : false,
                        onTap: () {
                          selectButton = 1;
                          setState(() {});
                        },
                        text: 'Coins',
                      ),
                    ),
                    Expanded(
                      child: CustomHomeCard(
                        color: selectButton == 2 ? true : false,
                        onTap: () {
                          selectButton = 2;
                          setState(() {});
                        },
                        text: 'Checks',
                      ),
                    ),
                    Expanded(
                      child: CustomHomeCard(
                        color: selectButton == 3 ? true : false,
                        onTap: () {
                          selectButton = 3;
                          setState(() {});
                        },
                        text: 'Totals',
                      ),
                    ),
                  ],
                ),
                if (selectButton == 0) const CashScreen()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
