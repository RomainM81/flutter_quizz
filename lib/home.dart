import 'package:flutter/material.dart';
import 'package:quiz_flutter/main.dart';
import 'question_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Quiz"),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              color: Colors.orangeAccent,
              elevation: 10,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/cover.jpg',
                      width: MediaQuery.of(context).size.width / 1.5,
                      height: MediaQuery.of(context).size.height / 3,
                      fit: BoxFit.cover,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext ctx) {
                          return QuestionPage();
                        }));
                      },
                      child: Text("Commencer le Quizz"),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.lightBlueAccent),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
