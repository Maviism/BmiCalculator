import 'dart:ui';

import 'package:bmi_calculator/brainCalc.dart';
import 'package:bmi_calculator/genderCards.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'resultPage.dart';
import 'package:bmi_calculator/const.dart';

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
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GenderCards(
                  genderColor: selectedGender == Gender.male
                      ? kActiveCard
                      : kInactivateCard,
                  genderType: 'Male',
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
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
                GenderCards(
                  genderColor: selectedGender == Gender.female
                      ? kActiveCard
                      : kInactivateCard,
                  genderType: 'Female',
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                )
              ],
            ),
          ),
          Expanded(
            flex: 7,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
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
                        Text('Height ${height.toString()}'),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        image: DecorationImage(
                            image: AssetImage('images/male.png'),
                            fit: BoxFit.fill),
                      ),
                      width: weight.toDouble() + 50,
                      height: height.toDouble() + 150,
                    ),
                  ),
                  Expanded(
                    child: Column(
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
                        Text('Weight ${weight.toString()}'),
                      ],
                    ),
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
