import 'package:cinema/models/acteur.dart';
import 'package:cinema/models/role.dart';
import 'package:cinema/widgets/shimmerlist.dart';
import 'package:flutter/material.dart';
import 'role/tile.dart';
import 'package:cinema/api/role_service.dart';

class RoleWidget extends StatelessWidget {
  final Acteur acteur;
  final service = RoleService();

  RoleWidget({required this.acteur, super.key});

  /*
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showErreur(
    BuildContext context,
  ) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text(
          "Erreur lors du fetch des établissements : $e",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(acteur.nom)),
      body: FutureBuilder<List<Role>>(
        future: service.fetch(acteur.personneId),
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
