
import 'package:flutter/material.dart';
import '../constants.dart';
class NextButton extends StatelessWidget {
  const NextButton({Key? key }):super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(10.0),          
        ),
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: const Text(
          'Next Question',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 23.0,color:Colors.white),
           
          
        ),
      );
  }
}