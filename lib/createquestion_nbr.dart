import 'package:flutter/material.dart';
import 'createquestion_content.dart';

TextEditingController nbrquestionController = new TextEditingController();

class Createquestionnbr extends StatefulWidget {
  @override
  _CreatequestionnbrState createState() => _CreatequestionnbrState();
}

class _CreatequestionnbrState extends State<Createquestionnbr> {
  String nbrquestion;
  int intnbrquestion;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[900],
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text('Nombre de question'),
        ),
        body: Center(
            child: Container(
                width: 350,
                height: 500,
                child: Column(children: [
                  Text("Bonjour",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                          color: Colors.white)),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  ),
                  Text("Veuilliez renseigner le nombre de question",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white)),
                  new TextField(
                    onChanged: (text) {
                      nbrquestion = text;
                    },
                    decoration: new InputDecoration(
                      hintText: "Merci de rentrer un chiffre",
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  ),
                  ElevatedButton(
                      child: Text("Créer un test"),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.black,
                      ),
                      onPressed: () => {
                            intnbrquestion = int.parse(nbrquestion),
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Createquestion(
                                    intnbrquestion: intnbrquestion),
                              ),
                            )
                          })
                ]))));
  }
}
