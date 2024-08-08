import 'package:flutter/material.dart';
import '../globals.dart'; 

class Screen3 extends StatelessWidget {
  const Screen3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Resultado")),
      backgroundColor: Color.fromRGBO(78, 30, 59, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(width: 200, child: Image.asset('assets/images/logo.png')),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
              child: Text(
                "${username} você fez ${rightAnswers} acerto(s). Experimente responder aos outros níveis de dificuldade",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            ElevatedButton(
                child: const Text("Recomeçar"),
                onPressed: () => {boot(), Navigator.pushNamed(context, '/')}),
          ],
        ),
      ),
    );
  }
}
