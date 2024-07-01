import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia_app/config/helpers/human_formats.dart';
import 'package:cinemapedia_app/domain/entities/movie.dart';
import 'package:flutter/material.dart';

typedef SearchMoviesCallback = Future<List<Movie>> Function(String query);

class SearchMovieDelegate extends SearchDelegate<Movie?> {
  List<Movie> initialMovies;
  final SearchMoviesCallback searchMovies;
  StreamController<List<Movie>> debouncedMovies = StreamController.broadcast();
  Timer? _debounced;

  SearchMovieDelegate(
      {required this.initialMovies, required this.searchMovies});

  void disposeStreams() {
    print('SearchMovieDelegate disposeStreams');
    debouncedMovies.close();
  }

  void _onQueryChanged() {
    print('Query changed: $query');
    if (_debounced?.isActive ?? false) _debounced!.cancel();
    _debounced = Timer(const Duration(milliseconds: 500), () async {
      print('Searching movies for query: $query');
      final movies = await searchMovies(query);
      initialMovies = movies;
      debouncedMovies.add(movies);
    });
  }

  @override
  String get searchFieldLabel => 'Buscar película';

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      FadeIn(
        animate: query.isNotEmpty,
        duration: const Duration(milliseconds: 100),
        child: IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            query = '';
          },
        ),
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        disposeStreams();
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildResulstsAndSuggestions();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    _onQueryChanged();
    return _buildResulstsAndSuggestions();
  }

  Widget _buildResulstsAndSuggestions() {
    return StreamBuilder<List<Movie>>(
      stream: debouncedMovies.stream,
      initialData: initialMovies,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text('Error al buscar películas'),
          );
        }

        final movies = snapshot.data ?? [];

        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final movie = movies[index];

            return _MovieItem(
              movie: movie,
              onMovieSelected: close,
            );
          },
        );
      },
    );
  }
}

class _MovieItem extends StatelessWidget {
  final Movie movie;
  final Function onMovieSelected;
  const _MovieItem(
      {required this.movie, super.key, required this.onMovieSelected});

  String get overview {
    if (movie.overview.length > 100) {
      return '${movie.overview.substring(0, 100)}...';
    }
    return movie.overview;
  }

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        onMovieSelected(context, movie);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: size.width * 0.2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  movie.posterPath,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return FadeIn(child: child);
                    }

                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: size.width * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(movie.title, style: textStyles.titleMedium),
                  Text(overview),
                  Row(
                    children: [
                      Icon(
                        Icons.star_half_rounded,
                        color: Colors.yellow.shade800,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        HumanFormats.number(movie.voteAverage, 1).toString(),
                        style: textStyles.bodyMedium!
                            .copyWith(color: Colors.yellow.shade800),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
