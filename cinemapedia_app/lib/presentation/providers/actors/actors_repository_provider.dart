import 'package:cinemapedia_app/infrastructure/datasources/actor_moviesdb_datasource.dart';
import 'package:cinemapedia_app/infrastructure/repositories/actor_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorsRepositoryProvider = Provider((ref) =>
    ActorsRepositoryImpl(actorsDatasource: ActorsMoviesDbDatasource()));
