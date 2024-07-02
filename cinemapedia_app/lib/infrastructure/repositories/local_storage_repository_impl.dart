import 'package:cinemapedia_app/domain/entities/movie.dart';
import 'package:cinemapedia_app/domain/repositories/local_storage_repository.dart';
import 'package:cinemapedia_app/infrastructure/datasources/isar_datasource.dart';

class LocalStorageRepositoryImpl extends LocalStorageRepository {
  final IsarDatasource datasource;

  LocalStorageRepositoryImpl({required this.datasource});

  @override
  Future<bool> isMovieFavorite(int movieId) {
    return datasource.isMovieFavorite(movieId);
  }

  @override
  Future<List<Movie>> loadMovies({int limit = 10, int offset = 0}) {
    return datasource.loadMovies(limit: limit, offset: offset);
  }

  @override
  Future<void> toogleFavorite(Movie movie) {
    return datasource.toogleFavorite(movie);
  }
}
