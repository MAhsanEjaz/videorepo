import 'package:cashintransect/services/custom_post_service.dart';
import 'package:flutter/cupertino.dart';

class TaskPostService {
  Future taskPostService({required BuildContext context, String? task}) async {
    try {
      Map body = {"title": task};

      var res = await CustomPostService().customPostService(
          context: context,
          body: body,
          url: 'https://nblschl.vercel.app/routes');

      if (res != null) {
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
