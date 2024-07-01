import 'package:cinemapedia_app/domain/entities/movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../movies/movies_repository_provider.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');

final searchMoviesProvider =
    StateNotifierProvider<SearchMoviesNotifier, List<Movie>>((ref) {
  final searchMovies = ref.read(movieRepositoryProvider).searchMovies;
  return SearchMoviesNotifier(
    ref: ref,
    searchMovies: searchMovies,
  );
});

typedef SearchMoviesCallback = Future<List<Movie>> Function(String query);

class SearchMoviesNotifier extends StateNotifier<List<Movie>> {
  final SearchMoviesCallback searchMovies;
  final Ref ref;

  SearchMoviesNotifier({
    required this.ref,
    required this.searchMovies,
  }) : super([]);

  Future<List<Movie>> searchMoviesByQuery(String query) async {
    final movies = await searchMovies(query);
    ref.read(searchQueryProvider.notifier).update((state) => query);
    state = movies;
    return movies;
  }
}
