import 'package:bmi_calculator/brainCalc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gender_selection/gender_selection.dart';
import 'resultPage.dart';

const String appBarText = 'BMI CALCULATOR';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  int height = 150;
  int weight = 50;
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
          Container(
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(5),
                child: Text('Male'),
                color: Colors.grey,
              ),
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(5),
                child: Text('Female'),
                color: Colors.grey,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RotatedBox(
                quarterTurns: 3,
                child: Slider(
                  value: height.toDouble(),
                  min: 50.0,
                  max: 220.0,
                  onChanged: (double newValue) {
                    setState(() {
                      height = newValue.toInt();
                    });
                  },
                ),
              ),
              Text('height${height.toString()}'),
              Text(weight.toString()),
              RotatedBox(
                quarterTurns: 3,
                child: Slider(
                  value: weight.toDouble(),
                  min: 10.0,
                  max: 120.0,
                  onChanged: (double newValue) {
                    setState(() {
                      weight = newValue.toInt();
                    });
                  },
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              BrainCalc calc = BrainCalc(heeight: height, weeight: weight);
              print(calc.perhitungan());
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ResultPage(
                      resultbmi: calc.perhitungan(),
                      rekomen: calc.hasil(),
                    );
                  },
                ),
              );
            },
            child: Text('cek hasil'),
          ),
        ],
      ),
    );
  }
}
