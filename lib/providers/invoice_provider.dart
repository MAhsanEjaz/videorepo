import 'package:cashintransect/models/invoice_model.dart';
import 'package:flutter/cupertino.dart';

class InvoiceProvider extends ChangeNotifier {
  InvoiceModel? invoiceModel;

  getInvoiceNumber({InvoiceModel? newInvoiceModel}) {
    invoiceModel = newInvoiceModel;
    notifyListeners();
  }
}
