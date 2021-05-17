import 'package:flutter/material.dart';
import 'package:projetuto/model/album.dart';
import 'createquestion_content.dart';
import 'package:projetuto/globalvariable.dart' as globals;

void initNbrquestion() {
  nbrquestionController.text = globals.nbr_question as String;
}

TextEditingController nbrquestionController = new TextEditingController();

class Createquestionnbr extends StatefulWidget {
  @override
  _CreatequestionnbrState createState() => _CreatequestionnbrState();
}

class _CreatequestionnbrState extends State<Createquestionnbr> {
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
          title: Text('Nombre de question'),
        ),
        body: Center(
            child: FutureBuilder<Album>(
                future: futureAlbum,
                builder: (context, snapshot) {
                  return Container(
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
                          controller: nbrquestionController,
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
                                  initNbrquestion(),
                                  print(globals.nbr_question),
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Createquestion(),
                                    ),
                                  )
                                })
                      ]));
                })));
  }
}
