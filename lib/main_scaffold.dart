import 'package:cinema/acteurs/acteurs.dart';
import 'package:cinema/carte/carte.dart';
import 'package:flutter/material.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _currentIndex = 0;

  final _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, // empêche le pop automatique
      onPopInvokedWithResult: (didPop, result) async {
        final navigator = _navigatorKeys[_currentIndex].currentState!;
        if (navigator.canPop()) {
          navigator.pop();
        }
      },
      child: Scaffold(
        body: Stack(
          children: List.generate(3, (index) {
            return Offstage(
              offstage: _currentIndex != index,
              child: Navigator(
                key: _navigatorKeys[index],
                onGenerateRoute: (settings) {
                  return MaterialPageRoute(builder: (_) => _getPage(index));
                },
              ),
            );
          }),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            if (index == _currentIndex) {
              _navigatorKeys[index].currentState?.popUntil((r) => r.isFirst);
            } else {
              setState(() => _currentIndex = index);
            }
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Carte'),
            BottomNavigationBarItem(
              icon: Icon(Icons.theater_comedy),
              label: 'Acteurs',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.quiz), label: 'Quiz'),
          ],
        ),
      ),
    );
  }

  Widget _getPage(int index) {
    return switch (index) {
      0 => const CarteWidget(),
      1 => const ActeursWidget(),
      2 => const ActeursWidget(),
      _ => const SizedBox(),
    };
  }
}
