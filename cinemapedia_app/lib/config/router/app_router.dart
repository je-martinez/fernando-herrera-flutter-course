import 'package:cinemapedia_app/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: '/home/0', routes: [
  GoRoute(
    name: HomeScreen.name,
    path: '/home/:page',
    builder: (context, state) {
      final pageIndex = int.tryParse(state.pathParameters['page'] ?? '0') ?? 0;
      return HomeScreen(
        pageIndex: pageIndex,
      );
    },
    routes: [
      GoRoute(
        name: MoviesScreen.name,
        path: 'movie/:movieId',
        builder: (context, state) => MoviesScreen(
          movieId: state.pathParameters['movieId'] ?? 'no-id',
        ),
      ),
    ],
  ),
  GoRoute(path: '/', redirect: (_, __) => '/home/0'),
]);
