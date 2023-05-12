import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomePage> {
  Map questions = {
    0: {'question': 'El hombre llegó a la luna', 'response': true},
    1: {'question': 'La gente vive más de 100 años', 'response': false},
    2: {'question': 'El perro es el mejor amigo del hombre', 'response': true},
    3: {'question': 'Cleopatra fue la mujer más poderosa', 'response': false},
    4: {
      'question': 'Si samson perdia su pelo perdia su fuerza',
      'response': true
    },
    5: {'question': 'The Office es la mejor serie', 'response': false},
    6: {'question': 'Dota 2 es el mejor juego', 'response': true},
  };

  int getIndex() {
    var indexQuestion = Random().nextInt(7);
    return indexQuestion;
  }

  String selectedQuestion(index) {
    return questions[index]['question'];
  }

  final verdadero = 'Verdadero';
  final falso = 'Falso';
  List<Widget> totalScore = [];

  void addScore({required bool isWinner}) {
    if (isWinner) {
      totalScore.add(
        const Expanded(
          child: Icon(
            Icons.check,
            color: Colors.green,
          ),
        ),
      );
    } else {
      totalScore.add(
        const Expanded(
          child: Icon(
            Icons.close,
            color: Colors.red,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    int index = getIndex();
    bool rigthResponse = questions[index]['response'];
    String question = selectedQuestion(index);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text(
          'QuizApp',
        ),
        centerTitle: true,
        elevation: 10,
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          //-> para no poner width infinty, hace que todos los hijos del children ocupen el máximo ancho del widget padre o sea del scaffold en este caso
          children: [
            Expanded(
                flex: 4,
                child: GestureDetector(
                  onTap: () {
                    print('dando click al boton');
                    setState(() {});
                  },
                  child: Container(
                    width: double.infinity,
                    color: Colors.black87,
                    child: Center(
                      child: Text(
                        question,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                )),
            Expanded(
                child: Container(
              color: Colors.black87,
              padding: const EdgeInsets.all(6),
              child: GestureDetector(
                onTap: () {
                  print('estamos en el verdadero');
                  bool win = false;
                  if (rigthResponse == true) {
                    print('Ganaste con verdadero');
                    win = true;
                    setState(() {});
                  } else {
                    print('perdiste con verdadero');
                    setState(() {});
                  }
                  print('llega acá');
                  addScore(isWinner: win);
                },
                child: Container(
                  width: double.infinity,
                  color: Colors.greenAccent,
                  child: Center(
                      child: Text(
                    verdadero,
                  )),
                ),
              ),
            )),
            Expanded(
                child: Container(
              color: Colors.black87,
              padding: const EdgeInsets.all(6),
              child: GestureDetector(
                onTap: () {
                  print('estamos en el falso');
                  bool win = false;
                  if (rigthResponse == false) {
                    print('Ganaste con el falso');
                    win = true;
                    setState(() {});
                  } else {
                    print('perdiste con el falso');
                    setState(() {});
                  }
                  print('llega acá');
                  addScore(isWinner: win);
                },
                child: Container(
                  color: Colors.redAccent,
                  child: Center(
                      child: Text(
                    falso,
                  )),
                ),
              ),
            )),
            // MaterialButton(
            //   onPressed: () {},
            //   color: Colors.blueAccent,
            // )
            Row(
              children: totalScore,
            ),
            MaterialButton(
              onPressed: () {
                totalScore = [];
                setState(() {});
              },
              color: Colors.blueAccent,
              child: const Text(
                'Reiniciar preguntas',
              ),
            )
          ]),
    );
  }
}
