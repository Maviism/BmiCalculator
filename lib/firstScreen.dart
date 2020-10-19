import 'dart:ui';

import 'package:bmi_calculator/brainCalc.dart';
import 'package:bmi_calculator/genderCards.dart';
import 'package:flutter/material.dart';
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
  int age = 25;
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      child: FloatingActionButton(
                        child: Text('+'),
                        onPressed: () {
                          setState(() {
                            age++;
                          });
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      width: 60,
                      height: 60,
                      color: Colors.purple,
                      child: Center(
                        child: Text(
                          age.toString(),
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      child: FloatingActionButton(
                        child: Text('-'),
                        onPressed: () {
                          setState(() {
                            age--;
                          });
                        },
                      ),
                    ),
                  ],
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
                        image: DecorationImage(
                            image: AssetImage(selectedGender == Gender.male
                                ? gambarLk
                                : gambarPr),
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
                  showDialog(
                    context: context,
                    child: AlertDialog(
                      title: Text('Hasil'),
                      content: SingleChildScrollView(
                        child: ListBody(children: [
                          Center(child: Text(calc.perhitungan())),
                          Text(calc.hasil())
                        ]),
                      ),
                      actions: [
                        TextButton(
                          child: Text('OK'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        )
                      ],
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
