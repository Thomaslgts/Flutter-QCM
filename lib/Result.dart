import 'package:flutter/material.dart';
import 'model/album.dart';
import 'homepage.dart';

class ResultFinalQuizz extends StatefulWidget {
  int Scored;
  int ScoredAllGood;
  ResultFinalQuizz({Key key, @required this.Scored, this.ScoredAllGood})
      : super(key: key);
  @override
  _ResultFinalQuizzState createState() =>
      _ResultFinalQuizzState(Scored, ScoredAllGood);
}

class _ResultFinalQuizzState extends State<ResultFinalQuizz> {
  int Scored;
  int ScoredAllGood;
  _ResultFinalQuizzState(this.Scored, this.ScoredAllGood);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Résultat du test"),
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
              Text(
                "Voici votre résultat : ",
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              ),
              Text(
                Scored.toString() + "/" + ScoredAllGood.toString(),
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              ),
              ElevatedButton(
                child: Text(
                  "Terminer",
                  style: TextStyle(fontSize: 30, color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.black,
                ),
                onPressed: () => {returntobase()},
              ),
            ],
          ),
        ),
      ),
    );
  }

  returntobase() {
    Scored = 0;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(),
      ),
    );
    print(Scored);
  }
}
