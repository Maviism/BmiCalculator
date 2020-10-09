import 'dart:ui';

import 'package:bmi_calculator/brainCalc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'resultPage.dart';

const String appBarText = 'BMI CALCULATOR';
const kActiveCard = Colors.blueGrey;
const kInactivateCard = Colors.grey;

const String gambarLk = 'images/male.png';
const String gambarPr = 'images/female.png';
Color colour;
enum Gender { male, female }

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  int height = 150;
  int weight = 50;
  Gender selectedGender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarText),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // SizedBox(
          //   height: 10,
          // ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  child: Container(
                    width: 80,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: selectedGender == Gender.male
                          ? kActiveCard
                          : kInactivateCard,
                    ),
                    child: Center(child: Text('Malee')),
                  ),
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
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  child: Container(
                    width: 80,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: selectedGender == Gender.female
                          ? kActiveCard
                          : kInactivateCard,
                    ),
                    child: Center(
                        child: Text(
                      'Female',
                    )),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 7,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      RotatedBox(
                        quarterTurns: 3,
                        child: Container(
                          width: 400,
                          child: SliderTheme(
                            data: SliderTheme.of(context)
                                .copyWith(trackHeight: 20),
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
                        ),
                      ),
                      Text('height ${height.toString()}'),
                    ],
                  ),
                  Container(
                    child: FittedBox(
                      child: Image.asset(
                        selectedGender == Gender.female ? gambarPr : gambarLk,
                        fit: BoxFit.fill,
                      ),
                    ),
                    width: 20,
                    height: height.toDouble(),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RotatedBox(
                        quarterTurns: 3,
                        child: Container(
                          width: 400,
                          height: 100,
                          child: SliderTheme(
                            data: SliderTheme.of(context)
                                .copyWith(trackHeight: 20),
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
                        ),
                      ),
                      Text('weight ${weight.toString()}'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              color: Colors.red,
              child: GestureDetector(
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
                child: Center(
                  child: Text(
                    'cek hasil',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
