import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'InputPage.dart';

// ignore: must_be_immutable
class ResultPage extends StatelessWidget {
  String? bmiResult;
  String? getResult;
  String? getInterpretation;
  ResultPage(
      {super.key,
      required this.bmiResult,
      required this.getResult,
      required this.getInterpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: const Text(
                "Your Result",
                style: kTitleText,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: activeCardColor,
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    getResult!.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Text(
                    bmiResult!,
                    style: kBMITextStyle,
                  ),
                  Text(
                    getInterpretation!,
                    style: kbodyTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyHomePage(),
                ),
              );
            },
            child: Container(
              height: bottomBoxHeight,
              width: double.infinity,
              color: bottomBoxColor,
              alignment: Alignment.center,
              padding: const EdgeInsets.only(bottom: 20.0),
              child: const Text(
                "RE-CALCULATE",
                style: kBoldBottomText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
