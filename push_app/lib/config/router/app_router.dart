import 'package:go_router/go_router.dart';
import 'package:push_app/presentation/screens/screen.dart';

final appRouter = GoRouter(routes: [
  GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen()),
]);
