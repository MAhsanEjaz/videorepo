import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class CustomGetService {
  Future customGetService({required BuildContext context, String? url}) async {
    try {
      http.Response response = await http.get(Uri.parse(url!));

      var jsonDecode = json.decode(response.body);

      if (response.statusCode == 200) {
        return jsonDecode;
      } else {
        return null;
      }
    } catch (err) {
      print(err);
      return null;
    }
  }
}
