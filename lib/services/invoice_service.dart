import 'package:cashintransect/models/invoice_model.dart';
import 'package:cashintransect/providers/invoice_provider.dart';
import 'package:cashintransect/services/custom_get_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class InvoiceService {
  Future invoiceService({required BuildContext context}) async {
    try {
      var res = await CustomGetService().customGetService(
          context: context,
          url:
              'http://45.35.97.246:5595/abcdwebapi/api/Customer/GenerateCartInvoiceNo');

      if (res != null) {
        InvoiceModel invoiceModel = InvoiceModel.fromJson(res);
        Provider.of<InvoiceProvider>(context, listen: false)
            .getInvoiceNumber(newInvoiceModel: invoiceModel);
        return true;
      } else {
        return false;
      }
    } catch (err) {
      print(err);
      return false;
    }
  }
}
