import 'dart:async';
import 'package:peliculas/model/Media.dart';
import 'package:peliculas/common/HttpHandler.dart';

abstract class MediaProvider {

  Future<List<Media>> fetchMedia(String category);
  
}

class MovieProvider extends MediaProvider {
  HttpHanlder _httpHandler = HttpHanlder.get();
  @override
  Future<List<Media>> fetchMedia(String category) {
    return _httpHandler.fetchMovies(category: category);
  }
}

class ShowProvider extends MediaProvider {
  HttpHanlder _httpHandler = HttpHanlder.get();
  @override
  Future<List<Media>> fetchMedia(String category) {
    return _httpHandler.fetchShow(category: category);
  }
}



enum MediaType {
  movie,show
}