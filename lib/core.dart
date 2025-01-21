import 'package:flutter/material.dart';

import 'questionClass.dart';

class QuizCore {
  // Keeps track of which is the current question of the display
  // Represents a index of the _questions array
  int _currentQuestionNumber = 0;

  final List<Question> _questions = [
    Question(text: 'Some cats are actually allergic to humans.', answer: true),
    Question(
        text: 'You can lead a cow down stairs but not up stairs.',
        answer: false),
    Question(
        text: 'Approximately one quarter of human bones are in the feet.',
        answer: true),
    Question(text: 'A slug\'s blood is green.', answer: true),
    Question(
        text: 'Buzz Aldrin\'s mother\'s maiden name was "Moon".', answer: true),
    Question(
        text: 'It is illegal to pee in the Ocean in Portugal.', answer: true),
    Question(
        text:
            'No piece of square dry paper can be folded in half more than 7 times.',
        answer: false),
    Question(
        text:
            'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        answer: true),
    Question(
        text:
            'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        answer: false),
    Question(
        text:
            'The total surface area of two human lungs is approximately 70 square metres.',
        answer: true),
    Question(text: 'Google was originally called "Backrub".', answer: true),
    Question(
        text:
            'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        answer: true),
    Question(
        text:
            'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        answer: true),
  ];

  String getQuestionText() {
    return _questions[_currentQuestionNumber].text;
  }

  bool getQuestionAnswer() {
    return _questions[_currentQuestionNumber].answer;
  }

  void getNextQuestion(BuildContext context) {
    if (_currentQuestionNumber < _questions.length - 1) {
      _currentQuestionNumber++;
    } else {
      // Show AlertDialog when quiz ends
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Quiz Completed"),
            content: const Text("You have reached the end of the quiz!"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  resetQuiz();
                },
                child: const Text("Retry"),
              ),
            ],
          );
        },
      );
    }
  }

  bool compareAnswer(bool userAnswer) {
    if (userAnswer == getQuestionAnswer()) {
      return true;
    } else {
      return false;
    }
  }

  List<Widget> updateScore(List<Widget> actualScore, String icon) {
    IconData iconData;
    Color color;
    switch (icon) {
      case 'check':
        iconData = Icons.check;
        color = Colors.green;
        break;
      case 'close':
        iconData = Icons.close;
        color = Colors.red;
      default:
        iconData = Icons.help;
        color = Colors.white;
    }
    actualScore.add(Icon(iconData, color: color));
    return actualScore;
  }

  void resetQuiz() {
    _currentQuestionNumber = 0;
  }

  bool hasQuizEnded() {
    if (_currentQuestionNumber == _questions.length - 1) {
      return true;
    }
    return false;
  }
}
