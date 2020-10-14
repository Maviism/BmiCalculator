import 'package:flutter/material.dart';

class GenderCards extends StatelessWidget {
  GenderCards({this.onPress, this.genderColor, this.genderType});

  final Function onPress;
  final Color genderColor;
  final String genderType;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: 80,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: genderColor,
        ),
        child: Center(child: Text(genderType)),
      ),
    );
  }
}
