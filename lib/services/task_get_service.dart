import 'package:cashintransect/models/task_model.dart';
import 'package:cashintransect/providers/task_provider.dart';
import 'package:cashintransect/services/custom_get_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class TaskGetService {
  Future taskGetService({required BuildContext context}) async {
    try {
      var res = await CustomGetService().customGetService(
          context: context, url: 'https://nblschl.vercel.app/routes');

      if (res != null) {
        TaskModel taskModel = TaskModel.fromJson(res);

        Provider.of<TaskProvider>(context, listen: false)
            .getTask(newData: taskModel.data);
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
