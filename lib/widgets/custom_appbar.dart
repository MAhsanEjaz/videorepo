import 'package:flutter/material.dart';

customAppBar(
    BuildContext context, String? title, Color? color, Color? backColor) {
  final appbarHeight = AppBar().preferredSize.height;
  return PreferredSize(
      preferredSize: Size.fromHeight(appbarHeight),
      child: AppBar(
        backgroundColor: backColor,
        elevation: 0,
        title: Text(
          title!,
          style: TextStyle(color: color),
        ),
      ));
}
