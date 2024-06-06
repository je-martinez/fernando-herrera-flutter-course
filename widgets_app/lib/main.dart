import 'package:flutter/material.dart';
import 'package:widgets_app/config/router/router.dart';
import 'package:widgets_app/config/theme/app_theme.dart';
// import 'package:widgets_app/presentation/screens/buttons/buttons_screen.dart';
// import 'package:widgets_app/presentation/screens/cards/cards_screen.dart';
// import 'package:widgets_app/presentation/screens/home/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: AppTheme(selectedColor: 0).getTheme(),
      // routes: {
      //   '/buttons': (context) => const ButtonsScreen(),
      //   '/cards': (context) => const CardScreen(),
      // },
    );
  }
}
