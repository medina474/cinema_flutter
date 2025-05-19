import 'package:flutter/material.dart';
import 'views/carte.dart';
import 'views/acteurs.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cinéma',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: Scaffold(body: ActeursWidget()),
      debugShowCheckedModeBanner: false,
    );
  }
}
