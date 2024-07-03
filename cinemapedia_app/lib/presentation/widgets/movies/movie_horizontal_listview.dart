import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia_app/config/helpers/human_formats.dart';
import 'package:cinemapedia_app/domain/entities/movie.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MovieHorizontalListView extends StatefulWidget {
  final List<Movie> movies;
  final String? title;
  final String? subtitle;
  final VoidCallback? loadNextPage;

  const MovieHorizontalListView(
      {super.key,
      required this.movies,
      this.title,
      this.subtitle,
      this.loadNextPage});

  @override
  State<MovieHorizontalListView> createState() =>
      _MovieHorizontalListViewState();
}

class _MovieHorizontalListViewState extends State<MovieHorizontalListView> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (widget.loadNextPage == null) return;

      if (scrollController.position.pixels + 200 >=
          scrollController.position.maxScrollExtent - 500) {
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
    return SizedBox(
      width: double.infinity,
      height: 370,
      child: Column(
        children: [
          if (widget.title != null || widget.subtitle != null)
            _Title(title: widget.title, subtitle: widget.subtitle),
          Expanded(
              child: ListView.builder(
                  controller: scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.movies.length,
                  itemBuilder: (context, index) {
                    final movie = widget.movies[index];
                    return FadeInRight(child: _Slide(movie: movie));
                  })),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Movie movie;

  const _Slide({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () {
        context.push(
          '/home/0/movie/${movie.id}',
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 150,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    movie.posterPath,
                    width: 150,
                    fit: BoxFit.contain,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return FadeIn(child: child);
                      return const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    },
                  )),
            ),
            const SizedBox(height: 5),
            SizedBox(
              width: 150,
              child: Text(
                movie.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: textStyles.titleSmall,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              width: 150,
              child: Row(
                children: [
                  Icon(Icons.star_half_outlined, color: Colors.yellow.shade800),
                  const SizedBox(width: 5),
                  Text(
                    movie.voteAverage.toString(),
                    style: textStyles.bodyMedium
                        ?.copyWith(color: Colors.yellow.shade800),
                  ),
                  const SizedBox(width: 5),
                  const Spacer(),
                  Text(HumanFormats.number(movie.popularity).toString(),
                      style: textStyles.bodyMedium),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String? title;
  final String? subtitle;

  const _Title({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return Container(
      padding: const EdgeInsets.only(top: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(children: [
        if (title != null) Text(title!, style: titleStyle),
        const Spacer(),
        if (subtitle != null)
          FilledButton.tonal(
              onPressed: () {},
              style: const ButtonStyle(visualDensity: VisualDensity.compact),
              child: Text(subtitle!)),
      ]),
    );
  }
}
