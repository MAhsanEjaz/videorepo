import 'package:cashintransect/providers/invoice_provider.dart';
import 'package:cashintransect/services/invoice_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InvoiceScreen extends StatefulWidget {
  const InvoiceScreen({Key? key}) : super(key: key);

  @override
  _InvoiceScreenState createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  invoiceHandler() {
    InvoiceService().invoiceService(context: context);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    invoiceHandler();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<InvoiceProvider>(builder: (context, data, _) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(''),
        ),
        body: SafeArea(
          child: Column(
            children: [
              data.invoiceModel == null
                  ? const Text('Wait')
                  : Text(data.invoiceModel!.data!.invoiceNo.toString())
            ],
          ),
        ),
      );
    });
  }
}
