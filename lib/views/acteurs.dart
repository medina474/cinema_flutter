import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/acteur.dart';

class ActeursWidget extends StatelessWidget {
  const ActeursWidget({super.key});

  Future<List<Acteur>> getActeurs() async {
    final url = 'http://localhost:4000/acteurs';
    final response = await http.get(Uri.parse(url));
    final List<dynamic> liste = jsonDecode(response.body);
    return liste.map((elt) => Acteur.fromJson(elt)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Acteur>>(
        future: getActeurs(),
        builder:
            (context, snapshot) => switch (snapshot.connectionState) {
              ConnectionState.waiting => Text("En cours"),
              ConnectionState.done => switch (snapshot) {
                _ when !snapshot.hasData => Text("Aucune donnée"),
                _ when snapshot.data!.isEmpty => Text("Aucun acteur trouvé"),
                _ => ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(snapshot.data![index].nom),
                      subtitle:
                          snapshot.data![index].age != null
                              ? Text("${snapshot.data![index].age} ans")
                              : Text(""),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.chevron_right),
                      ),
                      leading: CircleAvatar(
                        child: ClipOval(
                          child: FadeInImage.assetNetwork(
                            placeholder: 'profile.jpg',
                            image:
                                "http://127.0.0.1:4003/insecure/w:300/rt:fill/g:no/plain/local:///profiles/${snapshot.data![index].personneId}.jpg",
                            imageErrorBuilder: (context, error, stackTrace) {
                              return Image.asset('profile.jpg');
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
              },
              _ => Text("Erreur"),
            },
      ),
    );
  }
}
