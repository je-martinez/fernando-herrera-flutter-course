import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia_app/domain/entities/movie.dart';
import 'package:cinemapedia_app/presentation/providers/providers.dart';
import 'package:cinemapedia_app/presentation/widgets/movies/movie_horizontal_listview.dart';
import 'package:cinemapedia_app/presentation/widgets/movies/movies_slideshow.dart';
import 'package:cinemapedia_app/presentation/widgets/shared/custom_appbar.dart';
import 'package:cinemapedia_app/presentation/widgets/shared/custom_bottom_navigation.dart';
import 'package:cinemapedia_app/presentation/widgets/shared/full_screen_loader.dart';

class HomeView extends ConsumerStatefulWidget {
  static const name = 'home_screen';
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final slideShowMovies = ref.watch(moviesSlideShowProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);
    final isLoading = ref.watch(initialLoadingProvider);

    return Scaffold(
        bottomNavigationBar: isLoading ? null : const CustomBottomNavigation(),
        // body: nowPlayingMovies.isEmpty
        body: isLoading
            ? const FullScreenLoader()
            : _NowPlayingMovies(
                nowPlayingMovies: nowPlayingMovies,
                slideShowMovies: slideShowMovies,
                popularMovies: popularMovies,
                topRatedMovies: topRatedMovies,
                upcomingMovies: upcomingMovies,
              ));
  }
}

class _NowPlayingMovies extends ConsumerWidget {
  final List<Movie> nowPlayingMovies;
  final List<Movie> slideShowMovies;
  final List<Movie> popularMovies;
  final List<Movie> topRatedMovies;
  final List<Movie> upcomingMovies;

  const _NowPlayingMovies({
    super.key,
    required this.nowPlayingMovies,
    required this.slideShowMovies,
    required this.popularMovies,
    required this.topRatedMovies,
    required this.upcomingMovies,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          floating: true,
          flexibleSpace: CustomAppBar(),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: 1,
            (context, index) => Column(
              children: [
                const SizedBox(height: 20),

                MoviesSlideshow(movies: slideShowMovies),

                MovieHorizontalListView(
                  movies: nowPlayingMovies,
                  title: 'En cines',
                  subtitle: 'lunes 20',
                  loadNextPage: () {
                    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
                  },
                ),

                MovieHorizontalListView(
                  movies: upcomingMovies,
                  title: 'Proximamente',
                  loadNextPage: () {
                    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
                  },
                ),

                MovieHorizontalListView(
                  movies: popularMovies,
                  title: 'Populares',
                  subtitle: 'Esta semana',
                  loadNextPage: () {
                    ref.read(popularMoviesProvider.notifier).loadNextPage();
                  },
                ),

                MovieHorizontalListView(
                  movies: topRatedMovies,
                  title: 'Mejores Calificadas',
                  subtitle: 'Desde siempre',
                  loadNextPage: () {
                    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
                  },
                ),

                // Expanded(
                //   child: ListView.builder(
                //     itemCount: nowPlayingMovies.length,
                //     itemBuilder: (context, index) {
                //       final movie = nowPlayingMovies[index];
                //       return ListTile(
                //         title: Text(movie.title),
                //         subtitle: Text(movie.overview),
                //       );
                //     },
                //   ),
                // ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
