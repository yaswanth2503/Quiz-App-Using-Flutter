import 'package:flutter/material.dart';
import '../models/question_model.dart';
import '../widgets/question_widget.dart';
import '../constants.dart';
import '../widgets/next_button.dart';
import '../widgets/options_card.dart';
import '../widgets/result_box.dart';//////////////////



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}):super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Question> _question =[
    Question(
      id: '10',
      title: 'Which of the following is an Olympic event in track and field?',
      options: {'Slalom':false,'Super-G':false,' Tour de France':false,'Marathon':true}
    ),
    Question(
      id: '11',
      title: 'what is 2+5 ?',
      options: {'6':false,'12':false,'7':true,'8':false}
    ),
    Question(
      id: '11',
      title: 'what is 15*15 ?',
      options: {'225':true,'230':false,'150':false,'200':false}
    ),
     Question(
      id: '11',
      title: 'what is 15*15 ?',
      options: {'225':true,'230':false,'150':false,'200':false}
    ),
  ];
  int index =0;
 
  bool isPressed = false;
    int score =0;
  bool isAlreadySelected = false;

  void nextquestion()
  {
    if(index == _question.length -1)
    {
     showDialog( //////////////////////////////////////////
        context: context,
        barrierDismissible: false,
        builder: (ctx) => ResultBox(
          result: score,
          questionLength: _question.length, onPressed: () { 

           },));

    }
    else{
      if(isPressed)
      {
      setState(() {
      index++;
      isPressed = false;      
      isAlreadySelected = false; //////////////

    });
      }
      else
      {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text ('Please Select any Option'),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(vertical: 20.0),
        ));
      }
    }    
  }
 
  void checkAnswerandUpdate(bool value)
  {
    if(isAlreadySelected)
    {
      return;
    }
    else
    {
      if(value == true)
      {
        score++;
      }  
        setState(() {
        isPressed = true;
        isAlreadySelected = true;
      });      
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: const Text('Sports Quiz App'),
        backgroundColor: background,
        shadowColor: Colors.transparent,
          actions: [
          Padding(padding: const EdgeInsets.all(18.0),
          child: Text('Score:$score',
          style: const TextStyle(fontSize: 20),
          ),),
        ],

      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            QuestionWidget(question: _question[index].title, totalQuestions: -_question.length, indexAction: index),
            const Divider(color: neutral),  
            const SizedBox(height: 25.0,),
            for(int i=0; i< _question[index].options.length; i++)
            GestureDetector(                        
              onTap: () => checkAnswerandUpdate(_question[index].options.values.toList()[i]),
                        child: OpticalCard(
              option: _question[index].options.keys.toList()[i],
              color: isPressed ? _question[index].options.values.toList()[i] == true ? correct :
              incorrect : neutral,
              ),
            ),
         
          ],
        ),
      ),
     floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: NextButton(
          nextquestion: nextquestion,
        ),
      ),

    );
  }
}