import 'package:cinemapedia_app/domain/entities/movie.dart';
import 'package:cinemapedia_app/domain/repositories/local_storage_repository.dart';
import 'package:cinemapedia_app/presentation/providers/storage/local_storage_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoriteMovieProvider =
    StateNotifierProvider<StorageMovieNotifier, Map<int, Movie>>((ref) {
  final localStorageRepository = ref.watch(localStorageRepositoryProvider);
  return StorageMovieNotifier(localStorageRepository: localStorageRepository);
});

class StorageMovieNotifier extends StateNotifier<Map<int, Movie>> {
  int page = 0;
  final LocalStorageRepository localStorageRepository;

  StorageMovieNotifier({required this.localStorageRepository}) : super({});

  Future<List<Movie>> loadNextPage() async {
    final movies =
        await localStorageRepository.loadMovies(offset: page * 10, limit: 20);
    page++;
    final tmpMovieMap = <int, Movie>{};
    for (final movie in movies) {
      tmpMovieMap[movie.id] = movie;
    }
    state = {...state, ...tmpMovieMap};
    return movies;
  }

  Future<void> toogleFavorite(Movie movie) async {
    await localStorageRepository.toogleFavorite(movie);
    final bool isMovieInFavorites = state[movie.id] != null;
    if (!isMovieInFavorites) {
      state = {...state, movie.id: movie};
    } else {
      state.remove(movie.id);
      state = {...state};
    }
  }
}
