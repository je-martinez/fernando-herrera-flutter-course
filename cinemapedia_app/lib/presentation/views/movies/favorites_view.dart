import 'package:cinemapedia_app/presentation/widgets/movies/movies_masonry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia_app/presentation/providers/providers.dart';

class FavoritesView extends ConsumerStatefulWidget {
  const FavoritesView({super.key});

  @override
  ConsumerState<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends ConsumerState<FavoritesView> {
  bool isLastPage = false;
  bool isLoading = false;

  @override
  void initState() {
    loadNextPage();
    super.initState();
  }

  void loadNextPage() async {
    if (isLoading || isLastPage) return;
    isLoading = true;
    final movies =
        await ref.read(favoriteMovieProvider.notifier).loadNextPage();
    if (movies.isEmpty) {
      isLastPage = true;
    }
    isLoading = false;
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final favoriteMovies = ref.watch(favoriteMovieProvider).values.toList();

    if (favoriteMovies.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.favorite,
              size: 100,
              color: Colors.grey,
            ),
            SizedBox(height: 20),
            Text('No tienes peliculas favoritas',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                )),
            SizedBox(height: 20)
          ],
        ),
      );
    }

    return Scaffold(
        body: MoviesMasonry(
      movies: favoriteMovies,
      loadNextPage: loadNextPage,
    ));
  }
}
