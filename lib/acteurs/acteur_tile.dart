import 'package:cinema/views/role.dart';
import 'package:flutter/material.dart';
import 'acteur_model.dart';
import '../widgets/networkfadeinimage.dart';

class ActeurTile extends StatelessWidget {
  final Acteur acteur;

  const ActeurTile({required this.acteur, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RoleWidget(acteur: acteur)),
        );
      },
      splashColor: Colors.black.withValues(alpha: 0.1), // Couleur de l'effet
      highlightColor: Colors.transparent,
      child: ListTile(
        title: Text(acteur.nom),
        subtitle: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("${acteur.drapeauUnicode}"),
            SizedBox(width: 8),
            acteur.age != null ? Text("${acteur.age} ans") : Text(""),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Badge
            Container(
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '${acteur.nbFilm}',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
            SizedBox(width: 8),
            Icon(Icons.chevron_right),
          ],
        ),
        leading: CircleAvatar(
          radius: 24,
          backgroundColor: Colors.grey[200],
          child: ClipOval(
            child: NetworkFadeInImage(
              imageUrl:
                  "http://127.0.0.1:4003/insecure/w:300/rt:fill/g:no/plain/local:///profiles/${acteur.personneId}.jpg",
              placeholder: 'profile.jpg',
              width: 48,
              height: 48,
            ),
          ),
        ),
      ),
    );
  }
}
