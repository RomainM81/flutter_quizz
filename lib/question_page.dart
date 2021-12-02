import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'question.dart';
import 'data.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({Key? key}) : super(key: key);

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  List<Question> questions = Datas().listeQuestions;

  int score = 0;
  int i = 0;
  int q = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Score: $score"),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Question numéro: $q/10"),
              Text(
                questions[i].question,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Image.asset("assets/${questions[i].imagePath}"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.red),
                      onPressed: () {
                        (questions[i].reponse == false)
                            ? showDial(
                                dialog: createAlerte(
                                    res: "C'est gagné !",
                                    img: "assets/vrai.jpg",
                                    expli: ""))
                            : showDial(
                                dialog: createAlerte(
                                    res: "C'est perdu !",
                                    img: "assets/faux.jpg",
                                    expli: questions[i].explication));
                        (questions[i].reponse == false) ? score++ : null;
                      },
                      child: Text("Faux")),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.green),
                      onPressed: () {
                        (questions[i].reponse == true)
                            ? showDial(
                                dialog: createAlerte(
                                    res: "C'est gagné !",
                                    img: "assets/vrai.jpg",
                                    expli: ""))
                            : showDial(
                                dialog: createAlerte(
                                    res: "C'est perdu !",
                                    img: "assets/faux.jpg",
                                    expli: questions[i].explication));
                        (questions[i].reponse == true) ? score++ : null;
                      },
                      child: Text("Vrai"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  SimpleDialog createSimple() {
    final simple = SimpleDialog(
      title: Text(
        "Bravo! Votre score est de $score point(s)!",
        textAlign: TextAlign.center,
      ),
      children: [
        const Divider(
          thickness: 2,
        ),
        option()
      ],
      elevation: 12,
    );
    return simple;
  }

  SimpleDialogOption option() {
    return SimpleDialogOption(
        padding: EdgeInsets.only(left: 150),
        onPressed: () {
          Navigator.pushNamed(context, '/home');
        },
        child: Text("OK"));
  }

  AlertDialog createAlerte(
      {required String res, required String img, required String expli}) {
    return AlertDialog(
      title: Text(res),
      actions: [
        Image.asset(img),
        SizedBox(
          height: 12,
        ),
        Center(
          child: Text(
            expli,
            textAlign: TextAlign.center,
          ),
        ),
        TextButton(
            onPressed: () {
              setState(() {
                //Ajouter popup avec score et bouton qui ramène à la Home
                // Navigator.of(context).pop();
                // Navigator.pushNamed(context, '/home')

                (q == 10)
                    ? showDial(dialog: createSimple())
                    : Navigator.of(context).pop();
                q++;
                (i != 9) ? i++ : null;
                print(q);
              });
            },
            child: Center(
              child: Text(
                "Question suivante",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black),
              ),
            )),
      ],
    );
  }

  Future<void> showDial({required Widget dialog}) async {
    await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext ctx) {
          return dialog;
        });
  }
}
