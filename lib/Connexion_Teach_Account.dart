import 'package:flutter/material.dart';
import 'Account_Teacher.dart';
import 'package:projetuto/model/album.dart';

class TeacherAccount extends StatefulWidget {
  TeacherAccount({Key key}) : super(key: key);

  @override
  _TeacherAccountState createState() => _TeacherAccountState();
}

class _TeacherAccountState extends State<TeacherAccount> {
  Future<Album> futureAlbum;
  final _formKey = GlobalKey<FormState>();
  TextEditingController logteacherController = new TextEditingController();
  TextEditingController mdpteacherController = new TextEditingController();

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
          title: Text('Administration'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Center(
          child: FutureBuilder<Album>(
            builder: (context, snapshot) {
              return Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        "Compte professeur",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
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
                        "Identifiant",
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
                        top: 30,
                      ),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Entrez votre identifiant';
                          }
                          return null;
                        },
                        controller: logteacherController,
                        style: TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          hintText: 'Entrez votre identifiant',
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
                      margin: EdgeInsets.only(top: 30),
                      padding: EdgeInsets.only(top: 20, bottom: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "Mot de passe",
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
                        top: 30,
                      ),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Entrez votre mot de passe';
                          }
                          return null;
                        },
                        obscureText: true,
                        controller: mdpteacherController,
                        style: TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          hintText: 'Entrez votre mot de passe',
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
                      margin: EdgeInsets.only(top: 60),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: Colors.black,
                        ),
                        onPressed: () => {
                          // if (_formKey.currentState.validate() &&
                          //     mdpteacherController.text ==
                          //         snapshot.data.codeSession)
                          //   {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfileTeacher(),
                            ),
                          )
                        },
                        //   else
                        //     {
                        //       showDialog(
                        //           context: context,
                        //           builder: (BuildContext context) =>
                        //               AlertDialog(
                        //                 title: const Text(
                        //                     'Oups petit problème ...'),
                        //                 content: new Column(
                        //                   mainAxisSize: MainAxisSize.min,
                        //                   crossAxisAlignment:
                        //                       CrossAxisAlignment.start,
                        //                   children: <Widget>[
                        //                     Text("Combinaison incorrect"),
                        //                   ],
                        //                 ),
                        //                 actions: <Widget>[
                        //                   new FlatButton(
                        //                     onPressed: () {
                        //                       Navigator.of(context).pop();
                        //                     },
                        //                     textColor:
                        //                         Theme.of(context).primaryColor,
                        //                     child: const Text('Fermer'),
                        //                   ),
                        //                 ],
                        //               ))
                        //     }
                        // },
                        child: const Text(
                          "Connexion",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

// Widget _buildPopup(BuildContext context) {
//   return new AlertDialog(
//     title: const Text('Oups petit problème ...'),
//     content: new Column(
//       mainAxisSize: MainAxisSize.min,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Text("Combinaison login/mot de passe n'est pas la bonne"),
//       ],
//     ),
//     actions: <Widget>[
//       new FlatButton(
//         onPressed: () {
//           Navigator.of(context).pop();
//         },
//         textColor: Theme.of(context).primaryColor,
//         child: const Text('Fermer'),
//       ),
//     ],
//   );
// }
