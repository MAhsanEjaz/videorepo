import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  double? height, width;
  String? title;
  Function()? onTap;

  CustomButton({this.title, this.width, this.height, this.onTap});

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
          height: widget.height,
          width: widget.width,
          child: CupertinoButton(
              color: Colors.black,
              onPressed: (widget.onTap),
              child: Text(widget.title!,))),
    );
  }
}
