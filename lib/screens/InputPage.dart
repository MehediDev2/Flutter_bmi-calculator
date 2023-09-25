import 'package:bmi_calculator/calculator_brain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/plus_minus_button.dart';
import 'result_page.dart';

enum Gender {
  male,
  female,
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Gender? selectedGen;
  int _currentSliderValue = 180;
  int kage = 25;
  int kweight = 80;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                // Male card
                Expanded(
                  child: ReusableCard(
                    color: selectedGen == Gender.male
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: const IconContent(
                      iconSelect: Icon(FontAwesomeIcons.mars, size: 80.0),
                      textType: "MALE",
                    ),
                    onPress: () {
                      setState(() {
                        selectedGen = Gender.male;
                      });
                    },
                  ),
                ),
                // Female Card
                Expanded(
                  child: ReusableCard(
                    color: selectedGen == Gender.female
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: const IconContent(
                      iconSelect: Icon(FontAwesomeIcons.venus, size: 80.0),
                      textType: "FEMALE",
                    ),
                    onPress: () {
                      setState(() {
                        selectedGen = Gender.female;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: ReusableCard(
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("HEIGHT", style: myText),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(_currentSliderValue.toString(),
                        style: kNumberTextbold),
                    const Text("cm"),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: const Color(0xFF8D8E98),
                    overlayColor: const Color(0x29EB1555),
                    thumbColor: bottomBoxColor,
                    thumbShape:
                        const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape:
                        const RoundSliderOverlayShape(overlayRadius: 30.0),
                  ),
                  child: Slider(
                    value: _currentSliderValue.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    label: _currentSliderValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _currentSliderValue = value.round();
                      });
                    },
                  ),
                ),
              ],
            ),
            color: activeCardColor,
          )),
          Expanded(
            child: Row(
              children: [
                // WEIGHT Reuseable Card *******
                Expanded(
                  child: ReusableCard(
                    color: activeCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'WEIGHT',
                          style: myText,
                        ),
                        Text(
                          kweight.toString(),
                          style: kNumberTextbold,
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 60,
                              height: 60,
                              child: MyButton(
                                icon: FontAwesomeIcons.minus,
                                kFunForWeightage: () {
                                  setState(() {
                                    kweight--;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 60,
                              height: 60,
                              child: MyButton(
                                  icon: FontAwesomeIcons.plus,
                                  kFunForWeightage: () {
                                    setState(() {
                                      kweight++;
                                    });
                                  }),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                // AGE Reuseable Card *********
                Expanded(
                  child: ReusableCard(
                    color: activeCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "AGE",
                          style: myText,
                        ),
                        Text(
                          kage.toString(),
                          style: kNumberTextbold,
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 60,
                              height: 60,
                              child: MyButton(
                                icon: FontAwesomeIcons.minus,
                                kFunForWeightage: () {
                                  setState(() {
                                    kage--;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              height: 60,
                              width: 60,
                              child: MyButton(
                                icon: FontAwesomeIcons.plus,
                                kFunForWeightage: () {
                                  setState(() {});
                                  kage++;
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculatorBrain calcBrain =
                  CalculatorBrain(height: _currentSliderValue, weight: kweight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiResult: calcBrain.calculateBMI(),
                    getResult: calcBrain.getResult(),
                    getInterpretation: calcBrain.getInterpretation(),
                  ),
                ),
              );
            },
            child: Container(
              height: bottomBoxHeight,
              width: double.infinity,
              color: bottomBoxColor,
              margin: const EdgeInsets.only(top: 10.0),
              padding: const EdgeInsets.only(bottom: 20.0),
              alignment: Alignment.center,
              child: const Text(
                "CALCULATE",
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
