import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  String? hint;
  double? width;
  Function(String)? onChanged;
  Color? textColor;
  Color? cardColor;
  TextEditingController? textEditingController;

  CustomTextField(
      {this.hint,
        this.width,
        this.onChanged,
      this.textEditingController,
      this.cardColor,
      this.textColor = Colors.black});

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: widget.width,
        child: Card(
          color: widget.cardColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 0,
          child: TextField(
            onChanged:(widget.onChanged) ,
            style: TextStyle(color: widget.textColor),
            keyboardType: TextInputType.number,
            controller: widget.textEditingController,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 12),
                hintText: widget.hint,
                border: InputBorder.none),
          ),
        ),
      ),
    );
  }
}
