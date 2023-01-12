import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CommonLoader {
  Widget load() {
    return SpinKitWave(
      itemBuilder: (BuildContext context, int index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: index.isEven ? Color(0xff324324) : Color(0xfff3433),
          ),
        );
      },
    );
  }
}
