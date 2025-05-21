import 'package:cinema/widgets/stars.dart';
import 'package:flutter/material.dart';
import '../../models/role.dart';
import 'package:cinema/utils/dateutils.dart';

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
          MaterialPageRoute(builder: (context) => FilmWidget(film: role)),
        );
        */
      },
      splashColor: Colors.black.withValues(alpha: 0.1), // Couleur de l'effet
      highlightColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Affiche du film
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                "http://127.0.0.1:3003/insecure/w:300/rt:fill/g:no/plain/local:///posters/${role.films.filmId}.jpg",
                width: 100,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            // Texte à droite de l'affiche
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    role.films.titre,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    role.alias,
                    style: const TextStyle(fontStyle: FontStyle.italic),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.calendar_month, size: 20),
                      SizedBox(width: 2),
                      Text(
                        '${role.films.annee}',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.schedule, size: 20),
                      SizedBox(width: 2),
                      Text(
                        AppDateUtils.formatDuration(role.films.duree),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      SizedBox(width: 8),
                      StarRatingOverlay(
                        rating: role.films.moyenne / 2.0,
                        size: 16,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    spacing: 4.0,
                    children:
                        role.films.genres
                            .map(
                              (g) => Text(
                                g.genre,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            )
                            .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
