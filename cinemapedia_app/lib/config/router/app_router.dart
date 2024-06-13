import 'package:cinemapedia_app/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
      name: HomeScreen.name,
      path: '/',
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          name: MoviesScreen.name,
          path: 'movie/:movieId',
          builder: (context, state) => MoviesScreen(
            movieId: state.pathParameters['movieId'] ?? 'no-id',
          ),
        ),
      ]),
]);
