import 'dart:async';
import 'dart:convert';
import 'package:appvideo/comoon/constantes.dart';
import 'package:http/http.dart' as http;
import 'package:appvideo/model/Media.dart';
import 'package:appvideo/comoon/constantes.dart';

class HttpHandler {
  final String _baseUrl = "api.themoviedb.org";
  final String _lenguaje = "es-ES";

  Future<dynamic> getJson(Uri uri) async {
    http.Response response = await http.get(uri);
    return json.decode(response.body);
  }

  Future<List<Media>> fetchMovies() {
    var movies = new Uri.https(_baseUrl, "3/movie/popular",
        {'api_key': API_KEY, 'page': "1", 'lenguage': _lenguaje});
    return getJson(movies).then(((data) =>
        data['results'].map<Media>((item) => new Media(item)).toList()));
  }
}
