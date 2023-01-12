import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDb {
  Future saveResponse({required BuildContext context, String? response}) async {
    final _prefs = await SharedPreferences.getInstance();
    _prefs.setString('data', response!);
    return true;
  }

  Future getResponse({required BuildContext context}) async {
    final _prefs = await SharedPreferences.getInstance();
    return _prefs.get('data');
  }
}
