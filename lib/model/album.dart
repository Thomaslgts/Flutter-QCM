import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

Future<Album> fetchAlbum() async {
  final response = await http.get(Uri.https('jsonkeeper.com', 'b/RXSH'));

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
  final String session;
  final String codeEtudiant;
  final List questions;
  final List reponse;

  Album(
      {@required this.questions,
      this.session,
      this.codeEtudiant,
      this.reponse});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      session: json['session'],
      codeEtudiant: json['code_etudiant'],
      questions: json["questions"],
    );
  }
}
