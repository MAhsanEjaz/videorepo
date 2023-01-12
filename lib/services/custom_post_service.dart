import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class CustomPostService {
  Future customPostService(
      {required BuildContext context, String? url, Map? body}) async {
    try {
      var headers = {'Content-Type': 'application/json'};

      http.Response response = await http.post(Uri.parse(url!),
          body: json.encode(body), headers: headers);

      print('body----> ${response.body}');
      print('statusCode----> ${response.statusCode}');

      var jsonDecode = json.decode(response.body);

      if (response.statusCode == 201) {
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
