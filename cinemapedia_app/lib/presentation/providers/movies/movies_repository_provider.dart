import 'package:cinemapedia_app/infrastructure/datasources/moviesdb_datasource.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia_app/infrastructure/repositories/movie_repository_impl.dart';

final movieRepositoryProvider = Provider(
    (ref) => MovieRepositoryImpl(moviesDatasource: MoviesDbDatasource()));
