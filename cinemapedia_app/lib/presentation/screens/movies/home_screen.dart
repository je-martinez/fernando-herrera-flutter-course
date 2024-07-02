import 'package:flutter/material.dart';
import 'package:cinemapedia_app/presentation/views/views.dart';
import 'package:cinemapedia_app/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home_screen';
  final int pageIndex;
  const HomeScreen({required this.pageIndex, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigation(pageIndex: pageIndex),
      body: IndexedStack(
        index: pageIndex,
        children: const [
          HomeView(),
          CategoriesView(),
          FavoritesView(),
        ],
      ),
    );
  }
}
