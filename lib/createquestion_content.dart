import 'package:flutter/material.dart';
import 'package:projetuto/model/album.dart';
import 'package:projetuto/globalvariable.dart' as globals;

TextEditingController nbrquestionController = new TextEditingController();

class Createquestion extends StatefulWidget {
  @override
  _CreatequestionState createState() => _CreatequestionState();
}

class _CreatequestionState extends State<Createquestion> {
  Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[900],
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text('Création questionnaire'),
        ),
        body: Center(
            child: FutureBuilder<Album>(
                future: futureAlbum,
                builder: (context, snapshot) {
                  return Container(
                      width: 350,
                      child: Column(children: [
                        ElevatedButton(
                            child: Text("Alors Alors ?"),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              onPrimary: Colors.black,
                            ),
                            onPressed: () => {print(globals.nbr_question)}),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                        ),
                        Text("Question"),
                        new TextField(
                          controller: nbrquestionController,
                          decoration: new InputDecoration(
                            hintText: "Première question",
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                        ),
                        Text("Réponse"),
                        new TextField(
                          controller: nbrquestionController,
                          decoration: new InputDecoration(
                            hintText: "Réponse 1",
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        new TextField(
                          controller: nbrquestionController,
                          decoration: new InputDecoration(
                            hintText: "Réponse 2",
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        new TextField(
                          controller: nbrquestionController,
                          decoration: new InputDecoration(
                            hintText: "Réponse 3",
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        new TextField(
                          controller: nbrquestionController,
                          decoration: new InputDecoration(
                            hintText: "Réponse 4",
                          ),
                          keyboardType: TextInputType.number,
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
                            onPressed: () =>
                                {print(nbrquestionController.text)})
                      ]));
                })));
  }
}
