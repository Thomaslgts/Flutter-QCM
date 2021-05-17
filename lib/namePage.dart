import 'package:flutter/material.dart';

class Information extends StatelessWidget {
  final _nom = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue[800],
        appBar: AppBar(
          backgroundColor: Colors.blue[800],
          title: Text('Quiz'),
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Text(
                    "Prêt pour l’examen ? C’est partie !",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  width: 300,
                  margin: EdgeInsets.only(top: 90),
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "Indiquez votre nom et votre prénom",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  width: 300,
                  padding: EdgeInsets.only(
                    top: 50,
                  ),
                  child: TextFormField(
                    controller: _nom,
                    style: TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      hintText: 'Entrez votre nom ',
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 300,
                  padding: EdgeInsets.only(
                    top: 50,
                  ),
                  child: TextFormField(
                    controller: _nom,
                    style: TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      hintText: 'Entrez votre prénom ',
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 90),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white, // background
                      onPrimary: Colors.black, // foreground
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Commencer",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
