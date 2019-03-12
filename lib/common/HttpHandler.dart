import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:peliculas/common/Constants.dart';
import 'package:peliculas/model/Media.dart';
import 'package:peliculas/common/MediaProvider.dart';

class HttpHanlder{

  static final _httpHandler = new HttpHanlder();

  final String _baseUrl = "api.themoviedb.org";
  final String _lenguaje = "es-ES";

  static HttpHanlder get(){
    return _httpHandler;
  }
  
  Future<dynamic> getJson(Uri uri) async {
    http.Response response = await  http.get(uri);
    return json.decode(response.body);
  }

  Future<List<Media>> fetchMovies({String category: "popular"}) async {
    var uri = new Uri.https(_baseUrl, "3/movie/$category",{
      'api_key': API_KEY,
      'page': "1",
      'language':_lenguaje
    });

    return getJson(uri).then((data) =>
      data['results'].map<Media>((item)=> new Media(item,MediaType.movie)).toList()
     );
  }

  Future<List<Media>> fetchShow({String category : "popular"}) async{
    var uri = new Uri.https(_baseUrl, "3/tv/$category",{
      'api_key': API_KEY,
      'page': "1",
      'language':_lenguaje
    });

    return getJson(uri).then((data) =>
      data['results'].map<Media>((item)=> new Media(item,MediaType.show)).toList()
     );
  }
}