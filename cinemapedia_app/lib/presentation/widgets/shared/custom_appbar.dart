import 'package:cinemapedia_app/domain/entities/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cinemapedia_app/presentation/delegates/search_movie_delegate.dart';
import 'package:cinemapedia_app/presentation/providers/providers.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends ConsumerWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;

    return SafeArea(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                Icon(Icons.movie_outlined, color: colors.primary),
                const SizedBox(width: 10),
                Text(
                  'Cinemapedia',
                  style: titleStyle,
                ),
                const Spacer(),
                IconButton(
                  icon: Icon(Icons.search, color: colors.primary),
                  onPressed: () {
                    final movieRepository = ref.read(movieRepositoryProvider);
                    showSearch<Movie?>(
                            context: context,
                            delegate: SearchMovieDelegate(
                                searchMovies: movieRepository.searchMovies))
                        .then((movie) => {
                              if (movie != null)
                                {context.push('/movie/${movie.id}')}
                            });
                  },
                ),
              ],
            ),
          )),
    );
  }
}
