import 'package:flutter/material.dart';
import '../../models/role.dart';

class RoleTile extends StatelessWidget {
  final Role role;

  const RoleTile({required this.role, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        /*
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FilmWidget(fil: role)),
        );
        */
      },
      splashColor: Colors.black.withValues(alpha: 0.1), // Couleur de l'effet
      highlightColor: Colors.transparent,
      child: ListTile(
        title: Text(role.alias),
        subtitle: Text(""),
        trailing: Icon(Icons.chevron_right),
      ),
    );
  }
}
