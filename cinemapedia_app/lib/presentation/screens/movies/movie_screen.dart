import 'package:cinemapedia_app/domain/entities/actor.dart';
import 'package:cinemapedia_app/domain/entities/movie.dart';
import 'package:cinemapedia_app/presentation/providers/movies/actors_provider.dart';
import 'package:cinemapedia_app/presentation/providers/movies/movie_info_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoviesScreen extends ConsumerStatefulWidget {
  final String movieId;
  static const name = 'movies_screen';

  const MoviesScreen({super.key, required this.movieId});

  @override
  _MoviesScreenState createState() => _MoviesScreenState();
}

class _MoviesScreenState extends ConsumerState<MoviesScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(movieInfoProvider.notifier).loadMovie(widget.movieId);
    ref.read(actorsByMovieProvider.notifier).loadActors(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    final Movie? movie = ref.watch(movieInfoProvider)[widget.movieId];
    final List<Actor>? actors =
        ref.watch(actorsByMovieProvider)[widget.movieId];

    return Scaffold(
        body: movie == null || actors == null
            ? const Center(child: CircularProgressIndicator())
            : _ContentMovie(
                movie: movie,
                actors: actors,
              ));
  }
}

class _ContentMovie extends StatelessWidget {
  final Movie movie;
  final List<Actor> actors;

  const _ContentMovie({
    super.key,
    required this.movie,
    required this.actors,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textStyles = Theme.of(context).textTheme;

    return CustomScrollView(
      physics: const ClampingScrollPhysics(),
      slivers: [
        _CustomSliverAppBar(
          movie: movie,
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _MovieSmallCover(movie: movie, size: size),
                              const SizedBox(width: 10),
                              _MovieInfo(
                                  size: size,
                                  movie: movie,
                                  textStyles: textStyles)
                            ],
                          ),
                        ),
                        _MovieGenreList(movie: movie),
                        const SizedBox(height: 3000),
                      ],
                    ),
                childCount: 1)),
      ],
    );
  }
}

class _CustomSliverAppBar extends StatelessWidget {
  final Movie movie;

  const _CustomSliverAppBar({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SliverAppBar(
      backgroundColor: Colors.black,
      expandedHeight: size.height * 0.7,
      foregroundColor: Colors.white,
      shadowColor: Colors.red,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        title: Text(
          movie.title,
          style: const TextStyle(fontSize: 20).copyWith(color: Colors.white),
          textAlign: TextAlign.start,
        ),
        background: Stack(
          children: [
            SizedBox.expand(
              child: Image.network(
                movie.posterPath,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox.expand(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.7, 1.0],
                    colors: <Color>[Colors.transparent, Colors.black87],
                  ),
                ),
              ),
            ),
            const SizedBox.expand(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    stops: [0.0, 0.4],
                    colors: <Color>[
                      Colors.black87,
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MovieInfo extends StatelessWidget {
  const _MovieInfo({
    super.key,
    required this.size,
    required this.movie,
    required this.textStyles,
  });

  final Size size;
  final Movie movie;
  final TextTheme textStyles;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: (size.width - 40) * 0.7,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              movie.title,
              style: textStyles.titleLarge,
            ),
            Text(
              movie.overview,
            ),
          ],
        ));
  }
}

class _MovieSmallCover extends StatelessWidget {
  const _MovieSmallCover({
    super.key,
    required this.movie,
    required this.size,
  });

  final Movie movie;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        movie.posterPath,
        width: size.width * 0.3,
      ),
    );
  }
}

class _MovieGenreList extends StatelessWidget {
  const _MovieGenreList({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Wrap(
        children: [
          ...movie.genreIds.map((gender) => Container(
              margin: const EdgeInsets.only(right: 10),
              child: Chip(
                visualDensity: VisualDensity.compact,
                label: Text(gender),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              )))
        ],
      ),
    );
  }
}
