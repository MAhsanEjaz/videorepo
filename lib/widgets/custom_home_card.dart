import 'package:flutter/material.dart';

class CustomHomeCard extends StatefulWidget {
  bool color;
  String? text;
  Function()? onTap;

  CustomHomeCard({required this.color, this.text, this.onTap});

  @override
  _CustomHomeCardState createState() => _CustomHomeCardState();
}

class _CustomHomeCardState extends State<CustomHomeCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (widget.onTap),
      child: Container(
        decoration: BoxDecoration(
            color: widget.color ? Colors.black54 : Colors.grey.shade300),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              widget.text!,
              style: TextStyle(
                  color: widget.color ? Colors.white : Colors.black,
                  fontWeight: widget.color ? FontWeight.bold : FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}
