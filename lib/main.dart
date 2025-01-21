import 'package:flutter/material.dart';
import 'package:quizzler/core.dart';

QuizCore core = QuizCore();

void main() => runApp(const Quiz());

class Quiz extends StatelessWidget {
  const Quiz({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scoreKeeper = [];
  bool quizStatus = core.hasQuizEnded();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                core.getQuestionText(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(foregroundColor: Colors.green),
              //textColor: Colors.white,
              //color: Colors.green,
              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                if (core.compareAnswer(true)) {
                  setState(() {
                    core.updateScore(scoreKeeper, 'check');
                  });
                } else {
                  setState(() {
                    core.updateScore(scoreKeeper, 'close');
                  });
                }
                quizStatus = core.hasQuizEnded();
                if (quizStatus == true) {
                  setState(() {
                    core.getNextQuestion(context);
                    core.resetQuiz();
                    scoreKeeper = [];
                  });
                }
                core.getNextQuestion(context);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(foregroundColor: Colors.red),
              //color: Colors.red,
              child: const Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                if (core.compareAnswer(false)) {
                  setState(() {
                    core.updateScore(scoreKeeper, 'check');
                  });
                } else {
                  setState(() {
                    core.updateScore(scoreKeeper, 'close');
                  });
                }
                quizStatus = core.hasQuizEnded();
                if (quizStatus == true) {
                  setState(() {
                    core.getNextQuestion(context);
                    core.resetQuiz();
                    scoreKeeper = [];
                  });
                }
                core.getNextQuestion(context);
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
