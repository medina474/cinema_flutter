import 'package:flutter/material.dart';
import 'package:cinema/main_scaffold.dart';

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
      home: MainScaffold(),
      debugShowCheckedModeBanner: true,
    );
  }
}
