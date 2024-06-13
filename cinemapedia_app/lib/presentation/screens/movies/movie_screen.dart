import 'package:flutter/material.dart';

class MoviesScreen extends StatelessWidget {
  final String movieId;
  static const name = 'movies_screen';

  const MoviesScreen({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('MovieScreen')),
        body: const Placeholder());
  }
}
