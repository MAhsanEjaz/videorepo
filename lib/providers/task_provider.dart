import 'package:cashintransect/models/task_model.dart';
import 'package:flutter/cupertino.dart';

class TaskProvider extends ChangeNotifier {
  List<Data>? data = [];

  getTask({List<Data>? newData}) {
    data = newData;
    notifyListeners();
  }
}
