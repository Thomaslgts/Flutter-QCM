import 'package:flutter/material.dart';

class ProfileTeacher extends StatefulWidget {
  @override
  _ProfileTeacherState createState() => _ProfileTeacherState();
}

class _ProfileTeacherState extends State<ProfileTeacher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      body: Column(
        children: [
          SafeArea(
            child: Container(
              margin: EdgeInsets.only(top: 40),
              child: Center(
                child: Text('Bienvenue dans votre espace professeur',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25, color: Colors.white)),
              ),
            ),
          ),
          Text('Vous avez 1 test en attente',
              style: TextStyle(fontSize: 25, color: Colors.white)),
        ],
      ),
    );
  }
}
