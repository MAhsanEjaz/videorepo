import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class RiveScreen extends StatefulWidget {
  const RiveScreen({Key? key}) : super(key: key);

  @override
  _RiveScreenState createState() => _RiveScreenState();
}

class _RiveScreenState extends State<RiveScreen> {
  String? name;

  List<String> countryName = [
    'Pakistan',
    'India',
    'China',
    'Afghanistan',
    'Morooco'
  ];

  String? hint;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          const Positioned(
            top: 0,
            bottom: 10,
            left: 0,
            right: 0,
            child: RiveAnimation.asset(
              'images/3293-6929-spring-demo.riv',
              fit: BoxFit.cover,
              // antialiasing: true,
            ),
          ),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: 0,
              child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaY: 6, sigmaX: 8),
                  child: Column(
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                        content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        ListView.builder(
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: InkWell(
                                                  onTap: () async {
                                                    showDialog(
                                                        barrierColor:
                                                            Colors.transparent,
                                                        context: context,
                                                        builder: (context) {
                                                          return AlertDialog(
                                                            elevation: 0,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            content: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
                                                                CupertinoActivityIndicator(
                                                                  radius: 16,
                                                                )
                                                              ],
                                                            ),
                                                          );
                                                        });

                                                    await Future.delayed(
                                                        Duration(seconds: 1));
                                                    Navigator.pop(context);

                                                    name = countryName[index];
                                                    setState(() {});
                                                    Navigator.pop(context);
                                                  },
                                                  child:
                                                      Text(countryName[index])),
                                            );
                                          },
                                          shrinkWrap: true,
                                          itemCount: countryName.length,
                                        )
                                      ],
                                    )));
                          },
                          child: const Text('Select Country')),
                      name == ''
                          ? const Text('Select Country')
                          : Text(name.toString()),
                      DropdownButton(
                          hint: Text(hint == null
                              ? 'Select Country'
                              : hint.toString()),
                          items: countryName.map((e) {
                            return DropdownMenuItem(
                              value: e,
                              child: Text(e),
                              onTap: () {
                                hint = e;
                                setState(() {});
                              },
                            );
                          }).toList(),
                          onChanged: (_) {}),
                      Text(hint.toString())
                    ],
                  ))),
        ],
      ),
    );
  }
}
