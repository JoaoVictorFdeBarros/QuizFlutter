import 'package:flutter/material.dart';
import '../globals.dart';

class Screen2 extends StatefulWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pergunta ${questionCounter}")),
      backgroundColor: Color.fromRGBO(78, 30, 59, 1),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
            SizedBox(width: 200, child: Image.asset('assets/images/logo.png')),
            Padding(
              padding: const EdgeInsets.fromLTRB(20,0,20,0),
              child: Text(
                "${actualQuestion}",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    backgroundColor: Color.fromRGBO(78, 30, 59, 1)),
              ),
            ),
            Column(
              children: actualOptions.asMap().entries.map((entry) {
                int index = entry.key;
                String option = entry.value;

                return ListTile(
                  title: Text(
                    option,
                    style: TextStyle(
                        color: answered
                            ? index == actualRightAnswer
                                ? green
                                : red
                            : white),
                  ),
                  leading: Radio<int>(
                    value: index,
                    groupValue: selectedOption,
                    onChanged: answered
                        ? null
                        : (int? value) {
                            setState(() {
                              selectedOption = value;
                            });
                          },
                  ),
                );
              }).toList(),
            ),
            Text(
              answered
                  ? "Resposta ${selectedOption == actualRightAnswer ? "correta" : "errada"}"
                  : "",
              style: TextStyle(
                  color: selectedOption == actualRightAnswer ? green : red),
            ),
            ElevatedButton(
              child: const Text("Continuar"),
              onPressed: () async {
                setState(() {
                  if (selectedOption == actualRightAnswer) {
                    rightAnswers++;
                  }

                  answered = true;
                });
                await Future.delayed(Duration(seconds: 1));
                setState(() {
                  answered = false;
                });

                questionCounter == 5
                    ? Navigator.pushNamed(context, '/screen3')
                    : updateQuestion();
              },
            ),
          ])),
    );
  }
}