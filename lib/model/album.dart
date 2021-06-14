import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://serveur-flutter.herokuapp.com/api/quiz/2706'));
  final jsonresponse = json.decode(response.body);
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print(jsonresponse[0]);

    return Album.fromJson(jsonresponse[0]);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Album {
  Session session;
  String codeSession;
  Album({@required this.session, this.codeSession});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      codeSession: json['codeSession'],
      session: Session.fromJson(jsonDecode(json['session'])),
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
