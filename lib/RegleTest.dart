import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Question.dart';
import 'package:projetuto/model/album.dart';

class RegleTest extends StatefulWidget {
  RegleTest({Key key}) : super(key: key);

  @override
  _RegleTestState createState() => _RegleTestState();
}

class _RegleTestState extends State<RegleTest> {
  Future<Album> futureAlbum;
  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Quiz',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            backgroundColor: Colors.blue[900],
            appBar: AppBar(
              backgroundColor: Colors.blue[900],
              title: Text('Quiz'),
            ),
            body: Center(
                child: FutureBuilder<Album>(
                    future: futureAlbum,
                    builder: (context, snapshot) {
                      return Column(children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                        ),
                        Center(
                          child: Text(
                            "Regle de votre test",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                        ),
                        Text(
                          "Votre test contient " +
                              snapshot.data.session.questions.length
                                  .toString() +
                              " questions" +
                              '\n \n' +
                              " Chaque questions aura un temps imparti de 120 secondes " +
                              '\n \n' +
                              "Une fois une question sélectionnée et le boutton suivant cliquer il est impossible de revenir en arrière" +
                              '\n \n' +
                              " Chaque question vaut 2 points",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white, // background
                            onPrimary: Colors.black, // foreground
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Question(),
                              ),
                            );
                          },
                          child: const Text(
                            "Commencer",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ]);
                    }))));
  }
}
