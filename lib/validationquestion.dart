import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
                child: Column(children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  ),
                  ElevatedButton(
                      child: Text("Valider le formulaire"),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.black,
                      ),
                      onPressed: () => {postTest()})
                ]))));
  }

  postTest() async {
    final uri = 'https://serveur-flutter.herokuapp.com/api/quiz';
    var requestBody = {
      'codeSession': "2706",
      'etudiant': "etudiant",
      'session': request,
    };
    http.Response response = await http.post(
      Uri.parse(uri),
      body: requestBody,
    );

    print(response.body);
  }
}
