import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia_app/infrastructure/datasources/isar_datasource.dart';
import 'package:cinemapedia_app/infrastructure/repositories/local_storage_repository_impl.dart';
import 'package:cinemapedia_app/domain/repositories/local_storage_repository.dart';

final localStorageRepositoryProvider = Provider<LocalStorageRepository>(
  (ref) => LocalStorageRepositoryImpl(datasource: IsarDatasource()),
);
