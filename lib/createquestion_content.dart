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
  bool _checkbox1 = false;
  bool _checkbox2 = false;
  bool _checkbox3 = false;
  bool _checkbox4 = false;
  int _score1 = 0;
  int _score2 = 0;
  int _score3 = 0;
  int _score4 = 0;
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
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(
            left: 40.0,
            right: 40.0,
            top: 30,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text("Question numéro " + lenghtquestion.toString(),
                    style: TextStyle(color: Colors.white, fontSize: 25)),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                ),
                TextField(
                  style: TextStyle(fontSize: 20),
                  controller: questionController,
                  decoration: new InputDecoration(
                    hintText: "Question",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                ),
                Text("Réponse",
                    style: TextStyle(color: Colors.white, fontSize: 25)),
                Text("Cocher pour séléctionner la bonne réponse.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontStyle: FontStyle.italic)),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                ),
                Row(children: [
                  Checkbox(
                      value: _checkbox1,
                      onChanged: (value) {
                        setState(() {
                          _checkbox1 = true;
                          _score1 = 2;
                        });
                      }),
                  SizedBox(
                    width: 200,
                    height: 20,
                    child: new TextField(
                      controller: answeroneController,
                      style: TextStyle(fontSize: 20),
                      decoration: new InputDecoration(
                        hintText: "Réponse 1",
                      ),
                    ),
                  ),
                ]),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                ),
                Row(children: [
                  Checkbox(
                      value: _checkbox2,
                      onChanged: (value) {
                        setState(() {
                          _checkbox2 = true;
                          _score2 = 2;
                        });
                      }),
                  SizedBox(
                    width: 200,
                    height: 20,
                    child: new TextField(
                      controller: answertowController,
                      style: TextStyle(fontSize: 20),
                      decoration: new InputDecoration(
                        hintText: "Réponse 2",
                      ),
                    ),
                  ),
                ]),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                ),
                Row(children: [
                  Checkbox(
                      value: _checkbox3,
                      onChanged: (value) {
                        setState(() {
                          _checkbox3 = true;
                          _score3 = 2;
                        });
                      }),
                  SizedBox(
                    width: 200,
                    height: 20,
                    child: new TextField(
                      style: TextStyle(fontSize: 20),
                      controller: answerthreeController,
                      decoration: new InputDecoration(
                        hintText: "Réponse 3",
                      ),
                    ),
                  ),
                ]),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                ),
                Row(children: [
                  Checkbox(
                      value: _checkbox4,
                      onChanged: (value) {
                        setState(() {
                          _checkbox4 = true;
                          _score4 = 2;
                        });
                      }),
                  SizedBox(
                    width: 200,
                    height: 20,
                    child: new TextField(
                      style: TextStyle(fontSize: 20),
                      controller: answerfourController,
                      decoration: new InputDecoration(
                        hintText: "Réponse 4",
                      ),
                    ),
                  )
                ]),
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
                            '","score":' +
                            _score1.toString() +
                            ',"correct":false},' +
                            '{"text":"' +
                            answertowController.text +
                            '","score":' +
                            _score2.toString() +
                            ',"correct":false},' +
                            '{"text":"' +
                            answerthreeController.text +
                            '","score":' +
                            _score3.toString() +
                            ',"correct":false},' +
                            '{"text":"' +
                            answerfourController.text +
                            '","score":' +
                            _score4.toString() +
                            ',"correct":false}]}' +
                            endrequest,
                        print(request),
                        _score1 = 0,
                        _score2 = 0,
                        _score3 = 0,
                        _score4 = 0,
                        _checkbox1 = false,
                        _checkbox2 = false,
                        _checkbox3 = false,
                        _checkbox4 = false,
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
                            '","score":' +
                            _score1.toString() +
                            ',"correct":false},' +
                            '{"text":"' +
                            answertowController.text +
                            '","score":' +
                            _score2.toString() +
                            ',"correct":false},' +
                            '{"text":"' +
                            answerthreeController.text +
                            '","score":' +
                            _score3.toString() +
                            ',"correct":false},' +
                            '{"text":"' +
                            answerfourController.text +
                            '","score":' +
                            _score4.toString() +
                            ',"correct":false}]},',
                        questionController.clear(),
                        answeroneController.clear(),
                        answertowController.clear(),
                        answerthreeController.clear(),
                        answerfourController.clear(),
                        _incrementCounter(),
                        _score1 = 0,
                        _score2 = 0,
                        _score3 = 0,
                        _score4 = 0,
                        _checkbox1 = false,
                        _checkbox2 = false,
                        _checkbox3 = false,
                        _checkbox4 = false,
                        print(request)
                      }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _incrementCounter() {
    setState(() {
      lenghtquestion++;
    });
  }
}
