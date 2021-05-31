import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

Future<Album> fetchAlbum() async {
  final response = await http.get(Uri.http('localhost:8080', 'api/quiz/321'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print(response.body);
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Album {
  Data data;

  Album({@required this.data});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      data: Data.fromJson(json["data"]),
    );
  }
}

class Data {
  final String codeSession;
  final String etudiant;
  Session session;

  Data({@required this.codeSession, this.session, this.etudiant});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      session: Session.fromJson(jsonDecode('session')),
      codeSession: json['codeSession'],
      etudiant: json["etudiant"],
    );
  }
}

class Session {
  final List questions;

  Session({@required this.questions});

  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(
      questions: json["questions"],
    );
  }
}
