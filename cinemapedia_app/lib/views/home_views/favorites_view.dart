import 'package:flutter/material.dart';

class FavoritesView extends StatelessWidget {
  static String name = 'favorites_view';
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Favoritos'),
        ),
        body: const Center(
          child: Text('Favoritos'),
        ));
  }
}
