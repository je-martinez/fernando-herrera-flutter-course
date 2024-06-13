import 'package:cinemapedia_app/config/constants/environment.dart';
import 'package:cinemapedia_app/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia_app/domain/entities/movie.dart';
import 'package:cinemapedia_app/infrastructure/mappers/movie_mapper.dart';
import 'package:cinemapedia_app/infrastructure/models/moviedb/moviedb_response.dart';
import 'package:dio/dio.dart';

class MoviesDbDatasource extends MoviesDatasource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.movieDBKey,
        'language': 'es-MX'
      }));

  List<Movie> _jsonToEntity(Map<String, dynamic> json) {
    try {
      final MovieDbResponse movieDbResponse = MovieDbResponse.fromJson(json);
      final List<Movie> movies = movieDbResponse.results
          .where(
              (moviedb) => moviedb.posterPath != MovieDefaults.no_poster.name)
          .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
          .toList();
      return movies;
    } catch (e) {
      return [];
    }
  }

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing', queryParameters: {
      'page': page,
    });
    final movies = _jsonToEntity(response.data);
    return movies;
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final response = await dio.get('/movie/popular', queryParameters: {
      'page': page,
    });
    final movies = _jsonToEntity(response.data);
    return movies;
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    final response = await dio.get('/movie/top_rated', queryParameters: {
      'page': page,
    });
    final movies = _jsonToEntity(response.data);
    return movies;
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async {
    final response = await dio.get('/movie/upcoming', queryParameters: {
      'page': page,
    });
    final movies = _jsonToEntity(response.data);
    return movies;
  }
}
