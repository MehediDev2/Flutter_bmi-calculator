import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class IconContent extends StatelessWidget {
  final Icon iconSelect;
  final String textType;
  const IconContent(
      {super.key, required this.iconSelect, required this.textType});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        iconSelect,
        const SizedBox(height: 15.0),
        Text(textType, style: myText),
      ],
    );
  }
}
