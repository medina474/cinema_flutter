import 'package:http/http.dart' as http;

class ApiClient {
  final _baseUrl = 'http://localhost';
  int port;

  ApiClient({this.port = 3000});

  Future<http.Response> get(String path) async {
    final url = Uri.parse('$_baseUrl:$port$path');
    return await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        // Ajoutez un token ici si besoin
      },
    );
  }
}
