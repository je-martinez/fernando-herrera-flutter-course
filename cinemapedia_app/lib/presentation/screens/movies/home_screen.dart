import 'package:cinemapedia_app/domain/entities/movie.dart';
import 'package:cinemapedia_app/presentation/providers/providers.dart';
import 'package:cinemapedia_app/presentation/widgets/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static const name = 'home_screen';
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final slideShowMovies = ref.watch(moviesSlideShowProvider);

    return Scaffold(
        bottomNavigationBar: const CustomBottomNavigation(),
        body: nowPlayingMovies.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : _NowPlayingMovies(
                nowPlayingMovies: nowPlayingMovies,
                slideShowMovies: slideShowMovies,
              ));
  }
}

class _NowPlayingMovies extends ConsumerWidget {
  final List<Movie> nowPlayingMovies;
  final List<Movie> slideShowMovies;

  const _NowPlayingMovies({
    super.key,
    required this.nowPlayingMovies,
    required this.slideShowMovies,
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
            (context, indext) => Column(
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
                  movies: nowPlayingMovies,
                  title: 'Populares',
                  subtitle: 'Desde siempre',
                  loadNextPage: () {
                    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
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
