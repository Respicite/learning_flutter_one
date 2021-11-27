import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    setState(() {
      _totalScore += score;
      _questionIndex++;
    });
  }

  void _retry(){
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  static const _questions = [
    { 'questionText': 'What is your favorite food?',
      'answers': [
        {'text': 'Hamburger', 'score': 5},
        {'text': 'Schnitzel', 'score': 3},
        {'text': 'Spaghetti', 'score': -5},
        {'text': 'Air', 'score': 0}]},
    { 'questionText': 'Do you play assassins in lol?',
      'answers': [
        {'text': 'Yes', 'score': -5},
        {'text': 'Sometimes', 'score': 0},
        {'text': 'Do Bruisers count?', 'score': -1},
        {'text': 'Never', 'score': 5}]},
    { 'questionText': 'Do you like Vi more than Jinx and why?',
      'answers': [
        {'text': 'Because of Caitlyn', 'score': 5},
        {'text': 'Because Jinx is just crazy', 'score': 3},
        {'text': 'Yes', 'score': 1},
        {'text': 'No?', 'score': -2}]},
    { 'questionText': 'Would you be angry if we assumed your gender?',
      'answers': [
        {'text': 'I will kill you', 'score': -5},
        {'text': 'Not really', 'score': 1},
        {'text': 'Could\'nt care less', 'score': 3},
        {'text': 'What is a gender?', 'score': 5}]},
    { 'questionText': 'Do you feel offended?',
      'answers': [
        {'text': 'YES!', 'score': -5},
        {'text': 'Yes', 'score': -3},
        {'text': 'Do I get something for free if I do?', 'score': 5},
        {'text': 'No', 'score': 3}]}
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('App bar Title'),),
        body: _questionIndex < _questions.length
          ? Quiz(questions: _questions, questionIndex: _questionIndex, answerQuestion: _answerQuestion)
          : Result(message: _totalScore, selectHandler: _retry),
      ),
    );
  }
}
