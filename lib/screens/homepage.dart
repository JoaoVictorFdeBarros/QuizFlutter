import 'package:flutter/material.dart';
import '../globals.dart';


class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Quiz")),
      backgroundColor: Color.fromRGBO(78, 30, 59, 1),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
            SizedBox(width: 200, child: Image.asset('assets/images/logo.png')),
            Column(
              children: [
                Text(
                  "Seu nome:",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    backgroundColor: Color.fromRGBO(78, 30, 59, 1),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(80, 0, 80, 0),
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      label: Text(""),
                    ),
                    onChanged: (value) {
                      setState(() {
                        username = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            Column(
              children: [
                 ListTile(
                  title: Text(
                    'Muito fácil',
                    style: TextStyle(color: Colors.white),
                  ),
                  selected: difficulty== "0",
                  leading: Radio<String>(
                    value: "0",
                    onChanged: (value) {
                      setState(() {
                        difficulty= value!;
                      });
                    },
                    groupValue: difficulty,
                  ),
                ),
                ListTile(
                  title: Text(
                    'Fácil',
                    style: TextStyle(color: Colors.white),
                  ),
                  selected: difficulty== "1",
                  leading: Radio<String>(
                    value: "1",
                    onChanged: (value) {
                      setState(() {
                        difficulty= value!;
                      });
                    },
                    groupValue: difficulty,
                  ),
                ),
                ListTile(
                  title: Text(
                    'Médio',
                    style: TextStyle(color: Colors.white),
                  ),
                  selected: difficulty== "2",
                  leading: Radio<String>(
                    value: '2',
                    onChanged: (value) {
                      setState(() {
                        difficulty= value!;
                      });
                    },
                    groupValue: difficulty,
                  ),
                ),
                 ListTile(
                  title: Text(
                    'Difícil',
                    style: TextStyle(color: Colors.white),
                  ),
                  selected: difficulty== "3",
                  leading: Radio<String>(
                    value: '3',
                    onChanged: (value) {
                      setState(() {
                        difficulty= value!;
                      });
                    },
                    groupValue: difficulty,
                  ),
                ),
                 ListTile(
                  title: Text(
                    'Muito dificil',
                    style: TextStyle(color: Colors.white),
                  ),
                  selected: difficulty== "4",
                  leading: Radio<String>(
                    value: "4",
                    onChanged: (value) {
                      setState(() {
                        difficulty= value!;
                      });
                    },
                    groupValue: difficulty,
                  ),
                ),
                
              ],
            ),
            ElevatedButton(
                child: const Text("Entrar"),
                onPressed: () => {
                      questionCounter = 0,
                        rightAnswers = 0,
                      createQuestionary(),
                      updateQuestion(),
                      Future.delayed(Duration(seconds:1), (){Navigator.pushNamed(context, '/screen2');})
                      
                    }),
          ])),
    );
  }
}