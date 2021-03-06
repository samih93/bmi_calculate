import 'package:bmi_calculate/bmi/BMIController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class BMICalculator extends StatelessWidget {
  late double _screen_height;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BMIController>(
        init: BMIController(),
        builder: (bMIController) {
          _screen_height = MediaQuery.of(context).size.height;
          print(_screen_height);
          return Scaffold(
              backgroundColor: Colors.deepPurple.shade600,
              appBar: AppBar(
                backgroundColor: Colors.deepPurple.shade600,
                centerTitle: true,
                title: Text("BMI Calculator"),
              ),
              body: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  bMIController.onChangeselectedMale();
                                  print(bMIController.isMaleselected);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color:
                                          bMIController.isMaleselected // Male
                                              ? Colors.red.shade400
                                              : Colors.deepPurple.shade800,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.male,
                                        color: Colors.white,
                                        size: _screen_height / 3 / 3,
                                      ),
                                      Text(
                                        "Male",
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 35),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  bMIController.onChangeselectedMale();
                                  print(bMIController.isMaleselected);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: !bMIController
                                              .isMaleselected // is Female
                                          ? Colors.red.shade400
                                          : Colors.deepPurple.shade800,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.female,
                                        color: Colors.white,
                                        size: _screen_height / 3 / 3,
                                      ),
                                      Text(
                                        "Female",
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 35),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.deepPurple.shade800,
                            borderRadius: BorderRadius.circular(5)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Height",
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  bMIController.height.round().toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "cm",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Slider(
                                value: bMIController.height,
                                max: 200,
                                min: 80,
                                onChanged: (value) {
                                  bMIController.onchangeSliderValue(value);
                                }),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.deepPurple.shade800,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Weight",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Text(
                                      bMIController.weight.toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 40),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        FloatingActionButton(
                                          mini: true,
                                          backgroundColor: Colors.grey.shade700,
                                          onPressed: () {
                                            bMIController.onchangeWeight(false);
                                          },
                                          child: Icon(
                                            Icons.remove,
                                            size: 30,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        FloatingActionButton(
                                          mini: true,
                                          backgroundColor: Colors.grey.shade700,
                                          onPressed: () {
                                            bMIController.onchangeWeight(true);
                                          },
                                          child: Icon(
                                            Icons.add,
                                            size: 30,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.deepPurple.shade800,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Age",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Text(
                                      bMIController.age.toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 40),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        FloatingActionButton(
                                          mini: true,
                                          backgroundColor: Colors.grey.shade700,
                                          onPressed: () {
                                            bMIController.onchangeAge(false);
                                          },
                                          child: Icon(
                                            Icons.remove,
                                            size: 30,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        FloatingActionButton(
                                          mini: true,
                                          backgroundColor: Colors.grey.shade700,
                                          onPressed: () {
                                            bMIController.onchangeAge(true);
                                          },
                                          child: Icon(
                                            Icons.add,
                                            size: 30,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: MaterialButton(
                      height: 50,
                      onPressed: () {
                        _onAlertWithCustomImagePressed(
                            context, bMIController.result);
                      },
                      child: Text(
                        "Calculate",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red,
                    ),
                  ),
                ],
              ));
        });
  }

  _onAlertWithCustomImagePressed(context, double result) {
    String bmi = result < 18.5
        ? "UnderWeight"
        : result > 18.5 && result < 24.9
            ? "Normal Weight"
            : result > 25 && result < 29.9
                ? "overweight "
                : "obese";
    var alertStyle = AlertStyle(animationDuration: Duration(milliseconds: 1));
    Alert(
      style: alertStyle,
      context: context,
      title: bmi,
      desc: "Result :" + result.round().toString(),
    ).show();
  }
}
