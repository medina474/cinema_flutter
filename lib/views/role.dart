import 'package:cinema/models/acteur.dart';
import 'package:cinema/widgets/shimmerlist.dart';
import 'package:flutter/material.dart';

class RoleWidget extends StatefulWidget {
  final Acteur acteur;

  const RoleWidget({required this.acteur, super.key});

  @override
  State<RoleWidget> createState() => _RoleWidgetState();
}

class _RoleWidgetState extends State<RoleWidget> {
  late Future<List<Role>> futureRole;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.acteur.nom)),
      body: FutureBuilder<List<Acteur>>(
        future: futureRole,
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
