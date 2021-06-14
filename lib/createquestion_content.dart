import 'package:flutter/material.dart';
import 'validationquestion.dart';

TextEditingController questionController = new TextEditingController();
TextEditingController answeroneController = new TextEditingController();
TextEditingController answertowController = new TextEditingController();
TextEditingController answerthreeController = new TextEditingController();
TextEditingController answerfourController = new TextEditingController();

class Createquestion extends StatefulWidget {
  int intnbrquestion;
  int lenghtquestion = 1;
  String endrequest = "]}";
  String request = '{"questions":[';
  Createquestion({
    Key key,
    @required this.intnbrquestion,
    lenghtquestion,
  }) : super(key: key);
  @override
  _CreatequestionState createState() =>
      _CreatequestionState(intnbrquestion, lenghtquestion, endrequest, request);
}

class _CreatequestionState extends State<Createquestion> {
  int intnbrquestion;
  int lenghtquestion;
  String endrequest;
  String request;
  _CreatequestionState(
      this.intnbrquestion, this.lenghtquestion, this.endrequest, this.request);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[900],
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text('Création questionnaire'),
        ),
        body: Container(
            margin: const EdgeInsets.only(
              left: 40.0,
              right: 40.0,
              top: 100,
            ),
            child: Column(children: [
              Text("Question Numéro " + lenghtquestion.toString(),
                  style: TextStyle(color: Colors.white, fontSize: 30)),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              ),
              Text("Question",
                  style: TextStyle(color: Colors.white, fontSize: 30)),
              new TextField(
                controller: questionController,
                decoration: new InputDecoration(
                  hintText: "Question",
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              ),
              Text("Réponse",
                  style: TextStyle(color: Colors.white, fontSize: 30)),
              new TextField(
                controller: answeroneController,
                decoration: new InputDecoration(
                  hintText: "Réponse 1",
                ),
              ),
              new TextField(
                controller: answertowController,
                decoration: new InputDecoration(
                  hintText: "Réponse 2",
                ),
              ),
              new TextField(
                controller: answerthreeController,
                decoration: new InputDecoration(
                  hintText: "Réponse 3",
                ),
              ),
              new TextField(
                controller: answerfourController,
                decoration: new InputDecoration(
                  hintText: "Réponse 4",
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              ),
              ElevatedButton(
                  child: Text("Question suivante"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black,
                  ),
                  onPressed: () => {
                        if (lenghtquestion == intnbrquestion)
                          {
                            request = request +
                                '{"questionText":"Q' +
                                lenghtquestion.toString() +
                                '.' +
                                questionController.text +
                                '","answers":[{"text":"' +
                                answeroneController.text +
                                '","score":0,"correct":false},' +
                                '{"text":"' +
                                answertowController.text +
                                '","score":0,"correct":false},' +
                                '{"text":"' +
                                answerthreeController.text +
                                '","score":0,"correct":false},' +
                                '{"text":"' +
                                answerfourController.text +
                                '","score":0,"correct":false}]}' +
                                endrequest,
                            print(request),
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ValidateQuestionFinal(
                                  request: request,
                                ),
                              ),
                            )
                          }
                        else
                          {
                            print(lenghtquestion),
                            request = request +
                                '{"questionText":"Q' +
                                lenghtquestion.toString() +
                                '.' +
                                questionController.text +
                                '","answers":[{"text":"' +
                                answeroneController.text +
                                '","score":0,"correct":false},' +
                                '{"text":"' +
                                answertowController.text +
                                '","score":0,"correct":false},' +
                                '{"text":"' +
                                answerthreeController.text +
                                '","score":0,"correct":false},' +
                                '{"text":"' +
                                answerfourController.text +
                                '","score":0,"correct":false}]},',
                            questionController.clear(),
                            answeroneController.clear(),
                            answertowController.clear(),
                            answerthreeController.clear(),
                            answerfourController.clear(),
                            _incrementCounter(),
                          }
                      })
            ])));
  }

  void _incrementCounter() {
    setState(() {
      lenghtquestion++;
    });
  }
}
