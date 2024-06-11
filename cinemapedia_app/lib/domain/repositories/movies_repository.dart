import 'package:cinemapedia_app/domain/entities/movie.dart';

abstract class MovieRepository {
  Future<Movie> getNowPlaying({int page = 1});
}
