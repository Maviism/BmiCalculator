import 'dart:ui';

import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  ResultPage({@required this.resultbmi, @required this.rekomen});

  final String resultbmi;
  final String rekomen;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        child: GestureDetector(
          child: Text('back'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      Text(
        resultbmi,
        style: TextStyle(color: Colors.white, fontSize: 50),
      ),
      Text(
        rekomen,
        style: TextStyle(color: Colors.white, fontSize: 50),
      ),
    ]);
  }
}
