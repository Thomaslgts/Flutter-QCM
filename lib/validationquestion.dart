import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:projetuto/homepage.dart';
import 'Account_Teacher.dart';
import 'dart:math';

class ValidateQuestionFinal extends StatefulWidget {
  String request;
  ValidateQuestionFinal({Key key, @required this.request}) : super(key: key);
  @override
  _ValidateQuestionFinalState createState() =>
      _ValidateQuestionFinalState(request);
}

class _ValidateQuestionFinalState extends State<ValidateQuestionFinal> {
  String request;
  _ValidateQuestionFinalState(this.request);
  Random random = new Random();
  var number;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Création questionnaire'),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(
            top: 100,
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              ),
              ElevatedButton(
                child: Text("Valider le formulaire"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.black,
                ),
                onPressed: () async => {
                  number = random.nextInt(1000),
                  await showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        _buildPopupDialog(context),
                  ),
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  postTest(number) async {
    final uri = 'https://serveur-flutter.herokuapp.com/api/quiz';
    var requestBody = {
      'codeSession': number.toString(),
      'etudiant': "etudiant",
      'session': request,
    };
    http.Response response = await http.post(
      Uri.parse(uri),
      body: requestBody,
    );
    print(response.body);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfileTeacher(),
      ),
    );
  }

  Widget _buildPopupDialog(BuildContext context) {
    return new AlertDialog(
      title: Text('Votre code de session est ' + number.toString()),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Veuillez le noter"),
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () async {
            await postTest(number);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            );
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Fermer'),
        ),
      ],
    );
  }
}
