import 'package:cashintransect/providers/cart_provider.dart';
import 'package:cashintransect/providers/invoice_provider.dart';
import 'package:cashintransect/providers/product_provider.dart';
import 'package:cashintransect/providers/task_provider.dart';
import 'package:cashintransect/screens/rive_screen.dart';
import 'package:cashintransect/screens/whats_app_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/calender_screen.dart';
import 'screens/credit_card_screen.dart';
import 'screens/invoice_screen.dart';
import 'screens/product_screen.dart';
import 'screens/target_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TaskProvider()),
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => InvoiceProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(
            useMaterial3: true,
            appBarTheme: const AppBarTheme(
                centerTitle: true,
                titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20))),
        // home: MainListScreen(),
        // home: Test(),
        // home: MySample(),
        home: InvoiceScreen(),
        // home: WhatsAppFlutter(),
        // home: RiveScreen(),
        // home: TargetScreen(),
        // home: TestScreen(),
        // home: CalenderScreen(),
        // home: FilesData(),
        // home: const SplashScreen(),
      ),
    );
  }
}
