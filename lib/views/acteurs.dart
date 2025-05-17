import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/acteur.dart';
import 'acteur/tile.dart';
import '../widgets/shimmerlist.dart';
import 'package:dart_phonetics/dart_phonetics.dart';

class ActeursWidget extends StatefulWidget {
  const ActeursWidget({super.key});

  @override
  State<ActeursWidget> createState() => _ActeursWidgetState();
}

class _ActeursWidgetState extends State<ActeursWidget> {
  _ActeursWidgetState();

  late Future<List<Acteur>> futureActors;
  List<Acteur> allActors = [];
  List<Acteur> filteredActors = [];

  bool isSearching = false;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    futureActors = getActeurs();
  }

  void startSearch() {
    setState(() {
      isSearching = true;
      filteredActors = allActors;
    });
  }

  void updateSearch(String query) {
    setState(() {
      final encoder = DoubleMetaphone.withMaxLength(10);
      final encoding = encoder.encode(query);
      debugPrint("$query ${encoding?.alternates}");

      if (encoding != null) {
        filteredActors =
            allActors
                .where(
                  (actor) =>
                      actor.metaphone.contains(encoding.alternates!.first),
                )
                .toList();
      }
    });
  }

  void stopSearch() {
    setState(() {
      isSearching = false;
      searchController.clear();
      filteredActors = allActors;
    });
  }

  Future<List<Acteur>> getActeurs() async {
    final url = 'http://localhost:4000/acteurs';
    final response = await http.get(Uri.parse(url));
    final List<dynamic> liste = jsonDecode(response.body);
    allActors = liste.map((elt) => Acteur.fromJson(elt)).toList();
    filteredActors = allActors;
    return allActors;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            isSearching
                ? TextField(
                  controller: searchController,
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: 'Rechercher...',
                    border: InputBorder.none,
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: stopSearch,
                    ),
                  ),
                  onChanged: updateSearch,
                )
                : Text("Acteurs"),
        actions: [
          if (!isSearching)
            IconButton(icon: Icon(Icons.search), onPressed: startSearch),
        ],
      ),
      body: FutureBuilder<List<Acteur>>(
        future: futureActors,
        builder:
            (context, snapshot) => switch (snapshot.connectionState) {
              ConnectionState.waiting => buildShimmerList(),
              ConnectionState.done => switch (snapshot) {
                _ when !snapshot.hasData => Text("Aucune donnée"),
                _ when snapshot.data!.isEmpty => Text("Aucun acteur trouvé"),
                _ => ListView.builder(
                  itemCount: filteredActors.length,
                  itemBuilder:
                      (context, index) =>
                          ActeurTile(acteur: filteredActors[index]),
                ),
              },
              _ => Text("Erreur"),
            },
      ),
    );
  }
}
