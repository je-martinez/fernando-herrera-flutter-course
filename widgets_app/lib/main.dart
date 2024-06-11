import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/router/router.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

import 'presentation/providers/theme_provider.dart';
// import 'package:widgets_app/presentation/screens/buttons/buttons_screen.dart';
// import 'package:widgets_app/presentation/screens/cards/cards_screen.dart';
// import 'package:widgets_app/presentation/screens/home/home_screen.dart';

void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isDarkMode = ref.watch(isDarkModeProvider);
    final int selectedColor = ref.watch(selectedColorProvider);

    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: AppTheme(selectedColor: selectedColor, isDarkMode: isDarkMode)
          .getTheme(),
      // routes: {
      //   '/buttons': (context) => const ButtonsScreen(),
      //   '/cards': (context) => const CardScreen(),
      // },
    );
  }
}
