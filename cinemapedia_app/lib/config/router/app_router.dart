import 'package:cinemapedia_app/presentation/screens/screens.dart';
import 'package:cinemapedia_app/views/views.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  ShellRoute(
      builder: (context, state, child) => HomeScreen(childView: child),
      routes: [
        GoRoute(
            name: HomeScreen.name,
            path: '/',
            builder: (context, state) => const HomeView(),
            routes: [
              GoRoute(
                name: MoviesScreen.name,
                path: 'movie/:movieId',
                builder: (context, state) => MoviesScreen(
                  movieId: state.pathParameters['movieId'] ?? 'no-id',
                ),
              ),
            ]),
        GoRoute(
            name: FavoritesView.name,
            path: '/favorites',
            builder: (context, state) => const FavoritesView(),
            routes: const []),
      ])

  //Normal Routes
  // GoRoute(
  //     name: HomeScreen.name,
  //     path: '/',
  //     builder: (context, state) => const HomeScreen(
  //           childView: Center(child: Text("Hola Papi")),
  //         ),
  //     routes: [
  //       GoRoute(
  //         name: MoviesScreen.name,
  //         path: 'movie/:movieId',
  //         builder: (context, state) => MoviesScreen(
  //           movieId: state.pathParameters['movieId'] ?? 'no-id',
  //         ),
  //       ),
  //     ]),
]);
