import 'package:cinema/models/motscle.dart';
import 'package:flutter/material.dart';

class GenreCapsules extends StatelessWidget {
  final List<Motscle> genres;

  const GenreCapsules({super.key, required this.genres});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0, // Espace horizontal entre les capsules
      runSpacing: 4.0, // Espace vertical entre les lignes si retour à la ligne
      children:
          genres.map((m) {
            return Chip(
              label: Text(m.motcle, style: const TextStyle(fontSize: 12)),
              backgroundColor: Colors.grey.shade200,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              visualDensity: VisualDensity.compact,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            );
          }).toList(),
    );
  }
}
