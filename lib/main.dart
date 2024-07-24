import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
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
  State<QuizPage> createState() => _QuizPageState();
}

List<Widget> scores = [
  Icon(
    Icons.check,
    color: Colors.green,
  ),
  Icon(
    Icons.close,
    color: Colors.red,
  )
];

class _QuizPageState extends State<QuizPage> {
  Expanded createButton(Color backColor, String text) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: backColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
        onPressed: () {
          setState(() {
            if (text == 'True') {
              scores.add(Icon(
                Icons.check,
                color: Colors.green,
              ));
            } else {
              scores.add(
                Icon(
                  Icons.close,
                  color: Colors.red,
                ),
              );
            }
          });
        },
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 25.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Expanded(
          flex: 5,
          child: Center(
            child: Text(
              'What is your name',
              style: TextStyle(color: Colors.white, fontSize: 35.0),
            ),
          ),
        ),
        createButton(Colors.green, 'True'),
        SizedBox(
          height: 20.0,
        ),
        createButton(Colors.red, 'False'),
        Row(
          children: scores,
        )
      ],
    );
  }
}
