import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia_app/presentation/providers/providers.dart';

class CustomBottomNavigation extends ConsumerWidget {
  final int pageIndex;
  const CustomBottomNavigation({required this.pageIndex, super.key});

  void onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/home/$index');
        break;
      case 1:
        context.go('/home/$index');
        break;
      case 2:
        context.go('/home/$index');
        break;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(initialLoadingProvider);

    if (isLoading) {
      return const SizedBox.shrink();
    }

    return BottomNavigationBar(
      elevation: 0,
      currentIndex: pageIndex,
      onTap: (index) => onItemTapped(context, index),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_max),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.label_outline),
          label: 'Categorías',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline),
          label: 'Favoritos',
        ),
      ],
    );
  }
}
