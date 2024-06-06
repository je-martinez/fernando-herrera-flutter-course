import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screens/screens.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
      name: 'home', path: '/', builder: (context, state) => const HomeScreen()),
  GoRoute(
      name: 'buttons',
      path: '/buttons',
      builder: (context, state) => const ButtonsScreen()),
  GoRoute(
      name: 'cards',
      path: '/cards',
      builder: (context, state) => const CardScreen())
]);
