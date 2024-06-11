import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screens/screens.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
      name: HomeScreen.name,
      path: '/',
      builder: (context, state) => const HomeScreen()),
  GoRoute(
      name: CounterScreen.name,
      path: '/counter',
      builder: (context, state) => const CounterScreen()),
  GoRoute(
      name: ButtonsScreen.name,
      path: '/buttons',
      builder: (context, state) => const ButtonsScreen()),
  GoRoute(
      name: CardScreen.name,
      path: '/cards',
      builder: (context, state) => const CardScreen()),
  GoRoute(
      name: ProgressScreen.name,
      path: '/progress',
      builder: (context, state) => const ProgressScreen()),
  GoRoute(
      name: SnackbarScreen.name,
      path: '/snackbars',
      builder: (context, state) => const SnackbarScreen()),
  GoRoute(
      name: AnimatedScreen.name,
      path: '/animated',
      builder: (context, state) => const AnimatedScreen()),
  GoRoute(
      name: UIControlsScreen.name,
      path: '/ui',
      builder: (context, state) => const UIControlsScreen()),
  GoRoute(
      name: AppTutorial.name,
      path: '/tutorial',
      builder: (context, state) => const AppTutorial()),
  GoRoute(
      name: InfiniteScrollScreen.name,
      path: '/infinite',
      builder: (context, state) => const InfiniteScrollScreen()),
  GoRoute(
      name: ThemeChangerScreen.name,
      path: '/theme-changer',
      builder: (context, state) => const ThemeChangerScreen()),
]);
