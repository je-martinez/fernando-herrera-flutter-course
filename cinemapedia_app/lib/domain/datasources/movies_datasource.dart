import 'package:cinemapedia_app/domain/entities/movie.dart';

abstract class MovieDatasource {
  Future<Movie> getNowPlaying({int page = 1});
}
