import 'package:cinema/models/acteur.dart';
import 'package:cinema/models/role.dart';
import 'package:cinema/widgets/shimmerlist.dart';
import 'package:flutter/material.dart';
import 'role/tile.dart';
import 'package:cinema/api/role_service.dart';

class RoleWidget extends StatefulWidget {
  final Acteur acteur;

  const RoleWidget({required this.acteur, super.key});

  @override
  State<RoleWidget> createState() => _RoleWidgetState();
}

class _RoleWidgetState extends State<RoleWidget> {
  final service = RoleService();
  late Future<List<Role>> futureRole;

  @override
  void initState() {
    futureRole = service.fetch(widget.acteur.personneId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.acteur.nom)),
      body: FutureBuilder<List<Role>>(
        future: futureRole,
        builder:
            (context, snapshot) => switch (snapshot.connectionState) {
              ConnectionState.waiting => buildShimmerList(),
              ConnectionState.done => switch (snapshot) {
                _ when !snapshot.hasData => Text("Aucune donnée"),
                _ when snapshot.data!.isEmpty => Text("Aucun acteur trouvé"),
                _ => ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder:
                      (context, index) => RoleTile(role: snapshot.data![index]),
                ),
              },
              _ => Text("Erreur"),
            },
      ),
    );
  }
}
