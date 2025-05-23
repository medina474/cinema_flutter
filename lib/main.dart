import 'package:cinema/api/acteur_service.dart';
import 'package:cinema/isarservice.dart';
import 'package:cinema/models/acteur.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'views/acteurs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final isar = await IsarService.init();
  final acteurRepo = ActeurService(isar);

  runApp(MainApp(acteurRepo: acteurRepo));
}

class MainApp extends StatelessWidget {
  final ActeurService acteurRepo;
  const MainApp({required this.acteurRepo, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cinéma',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: ActeursWidget(acteurRepo: acteurRepo),
      debugShowCheckedModeBanner: true,
    );
  }
}
