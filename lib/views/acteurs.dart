import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/acteur.dart';
import 'acteur/tile.dart';
import '../widgets/shimmerlist.dart';

class ActeursWidget extends StatelessWidget {
  const ActeursWidget({super.key});

  Future<List<Acteur>> getActeurs() async {
    final url = 'http://localhost:4000/acteurs';
    final response = await http.get(Uri.parse(url));
    final List<dynamic> liste = jsonDecode(response.body);
    return liste.map((elt) => Acteur.fromJson(elt)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Acteurs")),
      body: FutureBuilder<List<Acteur>>(
        future: getActeurs(),
        builder:
            (context, snapshot) => switch (snapshot.connectionState) {
              ConnectionState.waiting => buildShimmerList(),
              ConnectionState.done => switch (snapshot) {
                _ when !snapshot.hasData => Text("Aucune donnée"),
                _ when snapshot.data!.isEmpty => Text("Aucun acteur trouvé"),
                _ => ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder:
                      (context, index) =>
                          ActeurTile(acteur: snapshot.data![index]),
                ),
              },
              _ => Text("Erreur"),
            },
      ),
    );
  }
}
