import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class MyPost {
  Future myPost({required BuildContext context, String? url, Map? body}) async {
    try {
      http.Response response =
          await http.post(Uri.parse(url!), body: json.encode(body));

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
