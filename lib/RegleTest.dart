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
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    ),
                    Center(
                      child: Text(
                        "Réglements :",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    ),
                    Container(
                      width: 300,
                      child: RichText(
                        text: TextSpan(
                          text: "Votre test contient " +
                              snapshot.data.session.questions.length
                                  .toString() +
                              " questions.\n\n",
                          style: TextStyle(color: Colors.white),
                          children: const <TextSpan>[
                            TextSpan(
                              text:
                                  'Chaque question aura un temps imparti de 15 secondes.\n\n',
                              style: TextStyle(color: Colors.white),
                            ),
                            TextSpan(
                                text:
                                    'Une fois une question sélectionnée et le bouton "suivant" presser, il est impossible de revenir en arrière.',
                                style: TextStyle(color: Colors.white)),
                          ],
                        ),
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
                  ],
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
