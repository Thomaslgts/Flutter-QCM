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
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Nombre de questions'),
      ),
      body: Center(
        child: Container(
          width: 350,
          height: 500,
          child: Column(
            children: [
              Text(
                "Veuillez renseigner le nombre de questions.",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      onChanged: (text) {
                        nbrquestion = text;
                      },
                      decoration: new InputDecoration(
                        hintText: "Saisissez un chiffre",
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Saisissez un chiffre';
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    ),
                    ElevatedButton(
                      child: Text("Suivant"),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.black,
                      ),
                      onPressed: () => {
                        if (_formKey.currentState.validate())
                          {
                            intnbrquestion = int.parse(nbrquestion),
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Createquestion(
                                    intnbrquestion: intnbrquestion),
                              ),
                            )
                          }
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
