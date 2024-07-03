import 'package:cinemapedia_app/domain/entities/movie.dart';
import 'package:cinemapedia_app/presentation/widgets/movies/movie_poster_link.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MoviesMasonry extends StatefulWidget {
  final List<Movie> movies;
  final VoidCallback? loadNextPage;

  const MoviesMasonry({
    required this.movies,
    this.loadNextPage,
    super.key,
  });

  @override
  State<MoviesMasonry> createState() => _MoviesMasonryState();
}

class _MoviesMasonryState extends State<MoviesMasonry> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (widget.loadNextPage == null) return;
      if (scrollController.position.pixels + 100 >=
          scrollController.position.maxScrollExtent) {
        widget.loadNextPage!();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: MasonryGridView.count(
          controller: scrollController,
          itemCount: widget.movies.length,
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          itemBuilder: (context, index) {
            final movie = widget.movies[index];
            final Widget item = MoviePosterLink(movie: movie);
            if (index == 1) {
              return Column(
                children: [const SizedBox(height: 40), item],
              );
            }

            return item;
          }),
    );
  }
}
