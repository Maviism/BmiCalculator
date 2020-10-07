import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gender_selection/gender_selection.dart';

const String appBarText = 'BMI CALCULATOR';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  double _height = 50;
  double _weight = 50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarText),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              width: 140,
              child: TextField(
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly
                ], //only number can be entered
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your Age',
                ),
              ),
            ),
          ),
          Expanded(
            child: GenderSelection(
              selectedGenderIconBackgroundColor: Colors.indigo, // default red
              checkIconAlignment: Alignment.centerRight, // default bottomRight
              selectedGenderCheckIcon: null, // default Icons.check
              onChanged: (Gender gender) {
                print(gender);
              },
              equallyAligned: true,
              animationDuration: Duration(milliseconds: 400),
              isCircular: true, // default : true,
              isSelectedGenderIconCircular: true,
              opacityOfGradient: 0.6,
              padding: const EdgeInsets.all(3),
              size: 120, //default : 120
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Row(
                    children: [
                      buildRotatedBox(_height),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Height'),
                          Text(_height.toString()),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Weight'),
                          Text(
                            _weight.toString(),
                          ),
                        ],
                      ),
                      buildRotatedBox(_weight),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Text('Hasiil'),
          ),
          Expanded(
            flex: 1,
            child: Text('Deskripsi'),
          ),
        ],
      ),
    );
  }

  RotatedBox buildRotatedBox(tipe) {
    return RotatedBox(
      quarterTurns: 3,
      child: Slider(
        value: tipe,
        min: 0,
        max: 120,
        label: tipe.round().toString(),
        onChanged: (double value) {
          setState(() {
            tipe = value;
            print(tipe);
          });
        },
      ),
    );
  }
}
