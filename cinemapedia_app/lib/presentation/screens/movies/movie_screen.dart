import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia_app/domain/entities/movie.dart';
import 'package:cinemapedia_app/presentation/providers/providers.dart';
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

    return Scaffold(
        body: movie == null
            ? const Center(child: CircularProgressIndicator())
            : _ContentMovie(
                movie: movie,
              ));
  }
}

class _ContentMovie extends StatelessWidget {
  final Movie movie;

  const _ContentMovie({
    super.key,
    required this.movie,
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
        _MovieScrollableContent(
            movie: movie, size: size, textStyles: textStyles),
      ],
    );
  }
}

class _MovieScrollableContent extends StatelessWidget {
  const _MovieScrollableContent({
    super.key,
    required this.movie,
    required this.size,
    required this.textStyles,
  });

  final Movie movie;
  final Size size;
  final TextTheme textStyles;

  @override
  Widget build(BuildContext context) {
    return SliverList(
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
                              size: size, movie: movie, textStyles: textStyles)
                        ],
                      ),
                    ),
                    _MovieGenreList(movie: movie),
                    const SizedBox(height: 10),
                    _MovieCastList(
                      movieId: movie.id.toString(),
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
            childCount: 1));
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
      actions: [
        IconButton(
          icon: const Icon(Icons.favorite_border),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(
            Icons.favorite_rounded,
            color: Colors.red,
          ),
          onPressed: () {},
        ),
      ],
      backgroundColor: Colors.black,
      expandedHeight: size.height * 0.7,
      foregroundColor: Colors.white,
      shadowColor: Colors.red,
      flexibleSpace: FlexibleSpaceBar(
        // titlePadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        // title: Text(
        //   movie.title,
        //   style: const TextStyle(fontSize: 20).copyWith(color: Colors.white),
        //   textAlign: TextAlign.start,
        // ),
        background: Stack(
          children: [
            SizedBox.expand(
              child: Image.network(movie.posterPath, fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return FadeIn(child: child);
                }
                return const SizedBox();
              }),
            ),
            const _CustomGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomCenter,
              stops: [0.0, 0.2],
              colors: [Colors.black54, Colors.transparent],
            ),
            const _CustomGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.8, 1.0],
              colors: [Colors.transparent, Colors.black87],
            ),
            const _CustomGradient(
              begin: Alignment.topLeft,
              stops: [0.0, 0.3],
              colors: [Colors.black87, Colors.transparent],
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomGradient extends StatelessWidget {
  final AlignmentGeometry begin;
  final AlignmentGeometry end;
  final List<double> stops;
  final List<Color> colors;

  const _CustomGradient({
    this.begin = Alignment.centerLeft,
    this.end = Alignment.centerRight,
    required this.stops,
    required this.colors,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: begin,
            end: end,
            stops: stops,
            colors: colors,
          ),
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

class _MovieCastList extends ConsumerWidget {
  final String movieId;

  const _MovieCastList({
    super.key,
    required this.movieId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final actorsByMovie = ref.watch(actorsByMovieProvider)[movieId];

    if (actorsByMovie == null) {
      return const CircularProgressIndicator(strokeWidth: 2);
    }

    // print(actorsByMovie.length);

    return SizedBox(
        height: 300,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: actorsByMovie.length,
          itemBuilder: (context, index) {
            final actor = actorsByMovie[index];
            return Container(
                padding: const EdgeInsets.all(8.0),
                width: 135,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeInRight(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          actor.profilePath,
                          width: 180,
                          height: 135,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      actor.name,
                      maxLines: 2,
                    ),
                    Text(
                      actor.character ?? '',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis),
                    )
                  ],
                ));
          },
        ));
  }
}
