import 'package:flutter/material.dart';
import 'package:projetuto/model/album.dart';
import 'createquestion_nbr.dart';

class ProfileTeacher extends StatefulWidget {
  @override
  _ProfileTeacherState createState() => _ProfileTeacherState();
}

class _ProfileTeacherState extends State<ProfileTeacher> {
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
          title: Text('Espace professeur'),
        ),
        body: Center(
            child: FutureBuilder<Album>(
                future: futureAlbum,
                builder: (context, snapshot) {
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                      ),
                      Text("Bonjour",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 50,
                              color: Colors.white)),
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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Createquestionnbr(),
                                  ),
                                )
                              })
                    ],
                  );
                })));
  }
}
