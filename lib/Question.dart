import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:projetuto/model/album.dart';
import 'Result.dart';

class Question extends StatefulWidget {
  Question({Key key}) : super(key: key);

  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  Future<Album> futureAlbum;

  int selectedIndex;
  int Scored = 0;
  int ScoredAllGood = 0;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    final _controller = new PageController();

    bool _isPause = true;
    bool _isRestart = false;

    return MaterialApp(
      title: 'Fetch Data Example',
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
                return PageView.builder(
                  controller: _controller,
                  physics: new NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data.session.questions.length,
                  itemBuilder: (context, inde) {
                    return Column(
                      children: [
                        Countdown(
                          seconds: 15,
                          build: (_, double time) => Text(
                            time.toString(),
                            style: TextStyle(
                              fontSize: 50,
                              color: Colors.white,
                            ),
                          ),
                          interval: Duration(milliseconds: 100),
                          onFinished: () {
                            _controller.nextPage(
                                duration: Duration(milliseconds: 400),
                                curve: Curves.easeIn);

                            setState(() {
                              _isRestart = true;
                            });
                          },
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              snapshot.data.session.questions[inde]
                                  ["questionText"],
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot
                                .data.session.questions[inde]["answers"].length,
                            itemBuilder: (context, index) {
                              return Center(
                                child: SizedBox(
                                  width: 250,
                                  child: new RaisedButton(
                                    child: new Text(
                                      snapshot.data.session.questions[inde]
                                          ["answers"][index]["text"],
                                    ),
                                    color: selectedIndex == index
                                        ? Colors.blue
                                        : null,
                                    onPressed: () {
                                      setState(() {
                                        selectedIndex = index;
                                        Scored = Scored +
                                            snapshot.data.session
                                                    .questions[inde]["answers"]
                                                [index]["score"];
                                        print(Scored.toString());
                                      });
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 100),
                          child: ElevatedButton(
                            onPressed: () {
                              if (inde ==
                                  snapshot.data.session.questions.length - 1) {
                                print("ok");
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ResultFinalQuizz(
                                        Scored: Scored,
                                        ScoredAllGood: ScoredAllGood),
                                  ),
                                );
                              } else {
                                setState(() {
                                  selectedIndex = null;
                                });
                                ScoredAllGood = Scored + 2;
                                _controller.nextPage(
                                    duration: Duration(milliseconds: 200),
                                    curve: Curves.easeIn);
                              }
                            },
                            child: Text("Suivant"),
                          ),
                        )
                      ],
                    );
                  },
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
