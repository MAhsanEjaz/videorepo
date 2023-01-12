import 'package:cashintransect/models/task_model.dart';
import 'package:cashintransect/providers/task_provider.dart';
import 'package:cashintransect/services/task_get_service.dart';
import 'package:cashintransect/services/task_post_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  TextEditingController controller = TextEditingController();

  getTaskHandler() async {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [CupertinoActivityIndicator()],
              ),
            ));

    bool res = await TaskGetService().taskGetService(context: context);

    Navigator.pop(context);

    print('getTsk----> $res');
  }

  taslHandler() async {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [CupertinoActivityIndicator()],
              ),
            ));
    await TaskPostService()
        .taskPostService(context: context, task: controller.text);
    getTaskHandler();
    Navigator.pop(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getTaskHandler();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(builder: (context, data, _) {
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            controller: controller,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                                onPressed: () {
                                  if (taslHandler()) {
                                    Navigator.pop(context);
                                  }
                                },
                                child: const Text('Save')),
                          )
                        ],
                      ),
                    ));
          },
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          elevation: 0,
          title: const Text(''),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                  addAutomaticKeepAlives: true,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: data.data!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 0,
                      child: ListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          title: Text(data.data![index].title.toString())),
                    );
                  })
            ],
          ),
        )),
      );
    });
  }
}
