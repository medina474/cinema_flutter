import 'package:cinema/api/acteur_service.dart';
import 'package:flutter/material.dart';
import '../models/acteur.dart';
import 'acteur/tile.dart';
import '../widgets/shimmerlist.dart';
import 'package:dart_phonetics/dart_phonetics.dart';

class ActeursWidget extends StatefulWidget {
  const ActeursWidget({super.key});

  @override
  State<ActeursWidget> createState() => _ActeursWidgetState();
}

class _ActeursWidgetState extends State<ActeursWidget>
    with SingleTickerProviderStateMixin {
  late Future<List<Acteur>> futureActors;
  List<Acteur> allActors = [];
  List<Acteur> filteredActors = [];

  bool isSearching = false;
  TextEditingController searchController = TextEditingController();

  final service = ActeurService();

  late AnimationController _iconRotationController;

  @override
  void initState() {
    super.initState();
    futureActors = service.fetch();
    _iconRotationController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _iconRotationController.dispose();
    searchController.dispose();
    super.dispose();
  }

  void startSearch() {
    setState(() {
      isSearching = true;
      filteredActors = allActors;
      _iconRotationController.forward();
    });
  }

  void updateSearch(String query) {
    setState(() {
      final encoder = DoubleMetaphone.withMaxLength(10);
      final encoding = encoder.encode(query);
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
      _iconRotationController.reverse();
    });
  }

  Widget _buildActorList(List<Acteur> data) {
    if (filteredActors.isEmpty && searchController.text.isEmpty) {
      allActors = data;
      filteredActors = data;
    }

    return ListView.builder(
      itemCount: filteredActors.length,
      itemBuilder:
          (context, index) => ActeurTile(acteur: filteredActors[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            isSearching
                ? TextField(
                  key: ValueKey('searchField'),
                  controller: searchController,
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: 'Rechercher...',
                    border: InputBorder.none,
                  ),
                  onChanged: updateSearch,
                )
                : Text("Acteurs", key: ValueKey('title')),
        actions: [
          IconButton(
            icon: AnimatedBuilder(
              animation: _iconRotationController,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _iconRotationController.value * 0.5 * 3.1416,
                  child: Icon(isSearching ? Icons.close : Icons.search),
                );
              },
            ),
            onPressed: () {
              if (isSearching) {
                stopSearch();
              } else {
                startSearch();
              }
            },
          ),
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
                _ => _buildActorList(snapshot.data!),
              },
              _ => Text("Erreur"),
            },
      ),
    );
  }
}
