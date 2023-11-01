import 'package:flutter/material.dart';
import '../constants.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({
    Key? key,
    required this.question,
    required this.totalQuestions,
    required this.indexAction,
  }) : super(key: key);

  final String question;
  final int indexAction;
  final int totalQuestions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0), // Adjust the padding as needed
      child: Container(
        alignment: Alignment.centerLeft,
        child: Text(
          'Question ${indexAction + 1}/$totalQuestions: $question',
          style: const TextStyle(
            fontSize: 24.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
