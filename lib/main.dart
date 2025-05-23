import 'package:flutter/material.dart';
import 'views/acteurs.dart';

void main() async {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cinéma',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: ActeursWidget(),
      debugShowCheckedModeBanner: true,
    );
  }
}
