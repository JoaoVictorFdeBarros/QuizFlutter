import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:math';

String username = "defaultUserName";
String difficulty= "0";
int questionCounter = 0;
int rightAnswers = 0;
String actualQuestion = "";
var actualOptions = <String>[""];
int actualRightAnswer = 0;
var questionIndexArray = [0, 1, 2, 3, 4];

var white = Colors.white;
var red = Colors.red;
var green = Colors.green;

var answered = false;

int? selectedOption = -1;

void createQuestionary() {
  questionIndexArray.shuffle(Random());
}

void updateQuestion() async {
  selectedOption = -1;

  final String response = await rootBundle.loadString("assets/questions/questions${difficulty}.json");
  final data = await json.decode(response);

  final Map<String, dynamic> question =
      data[questionIndexArray[questionCounter]];
  questionCounter++;

  actualQuestion = question['question'];
  actualOptions = [];

  for (int i = 0; i < question['options'].length; i++) {
    actualOptions.add(question['options'][i]);
  }

  String correctAnswer = actualOptions[question['correctAnswer']];
  actualOptions.shuffle(Random());

  actualRightAnswer = actualOptions.indexOf(correctAnswer);
}

class Client {
  int value;

  Client(this.value);
}

void boot() {
  difficulty= "0";
  questionCounter = 0;
  rightAnswers = 0;
  actualQuestion = "";
  actualOptions = <String>[""];
  actualRightAnswer = 0;
  questionIndexArray = [0, 1, 2, 3, 4];
}