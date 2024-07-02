import 'package:flutter/material.dart';
import 'package:cinemapedia_app/presentation/views/views.dart';
import 'package:cinemapedia_app/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: CustomBottomNavigation(),
      body: HomeView(),
    );
  }
}
