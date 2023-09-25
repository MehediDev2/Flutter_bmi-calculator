// ignore: camel_case_types
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  // ignore: non_constant_identifier_names
  const MyButton({super.key, required this.icon, this.kFunForWeightage});
  final IconData icon;
  final Function()? kFunForWeightage;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
        // 0xFF4C4F5E
        backgroundColor:
            MaterialStateProperty.all(const Color.fromRGBO(76, 79, 94, 1.0)),
      ),
      onPressed: kFunForWeightage,
      child: Icon(icon),
    );
  }
}
